# require"pry"

# class Transfer
  
#   attr_accessor :sender, :receiver,:status,:amount
#   # your code here
  
#   def initialize(sender, receiver,amount )
    
#   # @transfer = transfer
    
#     @sender = sender 
    
#     @receiver = receiver
    
#   # @status = status
    
#     @transfer_amount = amount
    
    
#     @status ="pending"
#     @amount = 50
    
#   end
  
  
#   def valid?
#     if @sender.valid? && @receiver.valid?
      
#       true 
      
#     else 
      
#       false 
      
#     end  
     
#   end
  
#   def execute_transaction
   
#   if valid? && status == "pending"
#       if amount < self.sender.balance
#         self.sender.balance -= amount
#         self.receiver.balance += amount
#         self.status = "complete"
#       else
#         self.status = "rejected"
#         "Transaction rejected. Please check your account balance."
#       end
#     else
#       self.status = "rejected"
#       "Transaction rejected. Please check your account balance."
#     end
    
#   end
# end
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
