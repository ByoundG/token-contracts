import expectThrow from './helpers/expectThrow';

const Token = artifacts.require('Token');
const TokenControllerMock = artifacts.require('TokenControllerMock');

contract('Token', (accounts) => {

  let token;
  let controller;

  let initialAmount;

  const owner = accounts[0];
  const allowed = accounts[1];
  const notAllowed = accounts[2];
  const randomGirl = accounts[3];
  const randomGuy = accounts[4];

  beforeEach(async() => {
    initialAmount = new web3.BigNumber(1000);
    token = await Token.new(initialAmount, 'Token', 'TKN', 18);
    controller = await TokenControllerMock.new();
    await controller.setAllowed(owner);
    await controller.setAllowed(allowed);

    await token.setController(controller.address);
  });

  it('should fail if initial token supply is 0', async () => {
    await expectThrow(Token.new(0, 'Token', 'TKN', 18));
  });

  it('should not be possible to call non-allowed functions', async () => {
    await expectThrow(token.sendTransaction({ from: owner, value: 10 }));  //test fallback function
    await expectThrow(token.transferOwnership(randomGuy ,{ from: randomGuy }));
    await expectThrow(token.setController(0));
    await expectThrow(token.setController(controller.address, { from: randomGuy }));
  });

  it('should be owned by owner', async () => {
      const tokenOwner = await token.owner.call();
      assert.equal(tokenOwner,owner);
  });

  it('should start with the correct initial amount', async () => {
    const amount = await token.totalSupply.call();
    const owned = await token.balanceOf.call(owner);

    assert.isTrue(amount.equals(initialAmount));
    assert.isTrue(owned.equals(initialAmount));
  });

  it('should not be possible to transfer for an address that is not allowed', async () => {
    await expectThrow(token.transfer(randomGirl, 1, { from: notAllowed }));
  });

  it('should be possible to transfer for an address that is allowed', async () => {
    await token.transfer(allowed, 1, { from: owner });
    await token.transfer(randomGirl, 1, { from: allowed });

    const balance = await token.balanceOf.call(randomGirl);
    assert.isTrue(balance.equals(1));
  });

  it('should not be possible to transfer from an address that is not allowed', async () => {
    await token.approve(randomGirl, 10, { from: notAllowed });
    await expectThrow(token.transferFrom(notAllowed, randomGuy, 10, { from: randomGirl }));
  });

  it('should be possible to transfer from an address that is not allowed', async () => {
    await token.transfer(allowed, 10, { from: owner });
    await token.approve(randomGirl, 10, { from: allowed });
    await token.transferFrom(allowed, randomGuy, 10, { from: randomGirl });

    const balance = await token.balanceOf.call(randomGuy);
    assert.isTrue(balance.equals(10));
  });

});
