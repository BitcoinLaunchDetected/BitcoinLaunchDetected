json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :user1_id, :user2_id, :amount
  json.url transaction_url(transaction, format: :json)
end
