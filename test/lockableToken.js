import expectThrow from './helpers/expectThrow';

const LockableTokenMock = artifacts.require('LockableTokenMock');

contract('LockableToken', (accounts) => {

  let token;
  const owner = accounts[0];
  const initialAmount = 1000;

  beforeEach(async () => {
    token = await LockableTokenMock.new(owner, initialAmount, { from: owner });
  });

  it('should set the start values properly', async () => {

    let locked = await token.locked.call();
    assert.equal(locked, true, 'Token is not locked');

    let _owner = await token.owner.call();
    assert.equal(_owner, owner, 'Token owner was set incorrectly');

  });


  it('should not transfer to account if locked', async () => {

    await expectThrow(token.transfer(accounts[1], 100));

  });

  it('should not transfer from if locked', async () => {
    await token.approve(accounts[1], 30);
    await expectThrow(token.transferFrom(owner, accounts[2], 30, { from: accounts[1] }));
  });

  it('should be possible to unlock and transfer', async () => {

    await token.unlock();

    const locked = await token.locked.call();
    assert.equal(locked, false, 'Token is locked');

    await token.transfer(accounts[1], 20);

    let balance = await token.balanceOf.call(accounts[1]);
    assert.equal(balance.valueOf(), 20, 'Balance not set correctly');

    await token.approve(accounts[1], 30);
    await token.transferFrom(owner, accounts[2], 30, {from: accounts[1]});
    balance = await token.balanceOf.call(accounts[2]);
    assert.equal(balance.valueOf(), 30, 'should be 30');
  });

});
