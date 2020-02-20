class Hugkumi < Company
  include StaffUtil
  include GroupCompanyUtil

  def system_fee
    @salse * 0.1
  end
end

class Hideandseek < Company
  include StaffUtil
  include GroupCompanyUtil

  def system_fee
    @salse * 0.2
  end

end

class Ukiyocreate < Company
  attr_reader　:staffs, :agency
  include StaffUtil
  include GroupCompanyUtil

  def post_initialize(args)
    @staffs = args[:staff]
    @agencies = args[:agency]
  end

  def salse
    @agencies.map(&:system_fee).inject(:+)
  end

  def enginners
    staff.push(manager).map do |sf|
      sf.skill.include?("enginner")
    end
  end
end

class Androots
  attr_reader :group_company
  include GroupCompanyUtil

  def post_initialize(args)
    @group_company = args[:group_company]
  end

  def salse
    @group_company.map(&:salse).inject(:+)
  end

  def add_group_company(new_company)
    group_company.push(new_company)
  end
end


module StaffUtil
  attr_reader :staffs

  def post_initialize(args)
    @staffs = args[:staff]
  end

  def enter_staff(staff)
    staffs.push(staff)
  end

  def leave_staffs(staff_names)
    staff_names.map{|staff_name| last_name(staff_name)} 
  end

  def leave_staff(staff_name)
    staffs.delete_if {|sf| sf.name = staff_name}
  end
end

module GroupCompanyUtil
  def self.concept_book
    "https://androots_concept_book/v1/"
  end
end

class Company
  attr_reader :salse, :ceo, :industory, :manager

  def initialize(args={})
    @salse = args[:salse]
    @ceo = args[:ceo]
    @industory = args[:industory]
    @manager = args[:manager] || default_manager
    post_initialize(args)
  end

  def post_initialize(args)
    nil
  end

  def manager
    @manager.add(ceo).uniq
  end

  def default_manager
    [ceo]
  end

  #  def default_tire_size
  #   raise NotImplementedError, "This #{self.class} cannot respond to: "
  # end

end

person = Porson.new(first_name: "rei", last_name: "yamaguchi", skill: ["communication", "programing", "management"])


class Person
  attr_reader :first_name, :last_name, :skill

  def initialize(args)
    @first_name = args[:first_name]
    @last_name = args[:last_name] || default_skill
    @skill = args[:skill]
  end

  def name
    first_name + last_name
  end

  def default_skill
    ["communicaiton"]
  end
end



