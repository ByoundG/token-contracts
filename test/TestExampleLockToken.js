import expectThrow from './helpers/expectThrow';

const ExampleLockToken = artifacts.require('ExampleLockToken');

contract('Locked Token', (accounts) => {

  let token;
  let owner = accounts[0];

  before(async () => {
    token = await ExampleLockToken.new();
  });

  it('should set the start values properly', async () => {

    let locked = await token.locked.call();
    assert.equal(locked, true, 'should be true');

    let supply = await token.totalSupply.call();
    assert.equal(supply.valueOf(), 0, 'should be 0');

    let _owner = await token.owner.call();
    assert.equal(_owner, owner, 'should be the owner of the token');

  });


  it('should not transfer to account because is locked', async () => {

    await expectThrow(token.transfer(accounts[1], 20));

  });

  it('should not transfer from to account because is locked', async () => {
    await token.approve(accounts[1], 30);
    await expectThrow(token.transferFrom(owner, accounts[2], 30, {from: accounts[1]}));
  });

  it('should unlock transfer function', async () => {

    await token.release();

    let locked = await token.locked.call();
    assert.equal(locked, false, 'should be true');

  });

  it('should transfer to account', async () => {

    await token.transfer(accounts[1], 20);

    let balanceAccount1 = await token.balanceOf.call(accounts[1]);
    assert.equal(balanceAccount1.valueOf(), 20, 'should be 20');

  });

  it('should transfer from to account', async () => {

    await token.transferFrom(owner, accounts[2], 30, {from: accounts[1]});
    let balanceAccount1 = await token.balanceOf.call(accounts[2]);
    assert.equal(balanceAccount1.valueOf(), 30, 'should be 30');

  });



});
