# Encoding: utf-8

require 'spec_helper'
=begin

describe 'mod leader' do

  before(:all) do
    start_daemon
  end

  after(:all) do
    stop_daemon
  end

  let(:client) do
    etcd_client
  end

  it 'should allow setting a key value with ttl' do
    client.set_leader('/db_master1', 'db01', 10)
    expect(client.get_leader('/db_master1')).to eq('db01')
  end

  it 'should allow deleting key with value' do
    client.set_leader('/db_master4', 'db04', 10)
    expect do
      client.delete_leader('/db_master4', 'db04')
    end.to_not raise_error
  end

  it 'should not allow deleting key without value' do
    client.set_leader('/db_master5', 'db05', 10)
    expect do
      client.delete_leader('/db_master5', 'db04')
    end.to raise_error
  end
end
=end
