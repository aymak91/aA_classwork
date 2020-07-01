# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  SELECT
    yr, subject
  FROM 
   nobels 
  WHERE
    subject = 'Physics'
  GROUP BY 
    yr
  HAVING 
    subject != 'Chemistry'

  SQL
end
#(
    # SELECT 
    #   *
    # FROM 
    #   nobels
    # WHERE 
    #    subject != 'Chemistry'
    #    ) AS parent