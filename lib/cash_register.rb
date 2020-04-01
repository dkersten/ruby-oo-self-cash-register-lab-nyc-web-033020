require 'pry'

class CashRegister

    attr_accessor :total, :discount, :title, :price, :quantity, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
    end

    # def discount
    #     @discount = discount
    # end

    def add_item(title, price, quantity=1)
        @title = title
        @price = price
        @quantity = quantity

        self.last_transaction = (price * quantity)
        
        self.total += (price * quantity)
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total = self.total - self.total * self.discount / 100
            self.total = self.total.to_i
            "After the discount, the total comes to $#{self.total}."
        end
    end

    def items
        item_list = []
        
        self.quantity.times {item_list << self.title}
        item_list
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction

        if items.length != 0
            self.total
        else
            self.total = 0.0
        end
    end
end