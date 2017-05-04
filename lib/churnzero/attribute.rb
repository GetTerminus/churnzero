# action (required) - Must be 'setAttribute'.
# entity (required) - Can be either 'contact' or 'account'.
# name (required) - Name of attibute to be updated.
# value (required) - New value of attibute.
module Churnzero
  class Attribute
    attr_writer :account_external_id
    attr_writer :contact_external_id
    attr_writer :entity
    attr_writer :name
    attr_writer :value

    def write!
      action = 'setAttribute'
      Client.new.get({
        action:               action,
        account_external_id:  @account_external_id,
        contact_external_id:  @contact_external_id,
        entity:               @entity,
        name:                 @name,
        value:                @value
      })
    end

    def incremement!
      action = 'incrementAttribute'
      Client.new.get({
        action:               action,
        account_external_id:  @account_external_id,
        contact_external_id:  @contact_external_id,
        entity:               @entity,
        name:                 @name,
        value:                @value
      })
    end
  end
end
