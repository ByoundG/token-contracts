import expectThrow from './helpers/expectThrow';

const ExampleToken = artifacts.require('ExampleToken');
const ERC223ReceivingContractMock = artifacts.require('./mocks/ERC223ReceivingContractMock.sol');

contract('Token', (accounts) => {

  var token;
  var owner = accounts[0];

  before(async () => {
    token = await ExampleToken.new();
  });

  it('verify start values', async () => {
    var name = await token.name.call();
    assert.equal(name, 'Example', 'should be Example');

    var symbol = await token.symbol.call();
    assert.equal(symbol, 'EXM', 'should be EXM');

    var decimals = await token.decimals.call();
    assert.equal(decimals.valueOf(), 18, 'should be 18');

    var supply = await token.totalSupply.call();
    assert.equal(supply.valueOf(), 0, 'should be 0');

    var _owner = await token.owner.call();
    assert.equal(_owner, owner, 'should be the owner of the token');

    var mintingFinished = await token.mintingFinished.call();
    assert.equal(mintingFinished, false, 'should be false');

  });

  it('dynamic supply', async () => {
    await token.mint(owner, 1000);

    var supply = await token.totalSupply.call();
    assert.equal(supply.valueOf(), 1000, 'should be 1000');

    var ownerBalance = await token.balanceOf.call(owner);
    assert.equal(ownerBalance.valueOf(), 1000, 'should be 1000');

    await token.finishMinting();
    var mintingFinished = await token.mintingFinished.call();
    assert.equal(mintingFinished, true, 'should be true');

    await expectThrow(token.mint(owner, 500));

    var supply = await token.totalSupply.call();
    assert.equal(supply.valueOf(), 1000, 'should be 1000');

  });

  it('transfer to account', async () => {
    await token.transfer(accounts[1], 20);

    var balanceAccount1 = await token.balanceOf.call(accounts[1]);
    assert.equal(balanceAccount1.valueOf(), 20, 'should be 20');

    it('approve spend tokens to another account, increase and decrease that amount', async () => {
      await token.approve(accounts[1], 45);

      var amountToSpend = await token.allowance.call(accounts[0], accounts[1]);

      assert.equal(amountToSpend.valueOf(), 45, "should be 45");

      await token.increaseApproval(accounts[1], 15);

      var amountToSpend = await token.allowance.call(accounts[0], accounts[1]);

      assert.equal(amountToSpend.valueOf(), 60, "should be 60");

      await token.decreaseApproval(accounts[1], 40);

      var amountToSpend = await token.allowance.call(accounts[0], accounts[1]);

      assert.equal(amountToSpend.valueOf(), 20, "should be 20");

    });

    it('tranfer from spender address', async () => {
      await token.transferFrom(accounts[0], accounts[2], 20, {from: accounts[1]});

      var balance = await token.balanceOf.call(accounts[2]);

      assert.equal(balance.valueOf(), 20, "should be 20");
    });

  });

  it('invalid transfer, no enough balance', async () => {
    await expectThrow(token.transfer(accounts[2], 10000));
    var ownerBalance = await token.balanceOf.call(owner);
    assert.equal(ownerBalance.valueOf(), 980, "should be 980");
  });
});
