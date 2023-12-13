# frozen_string_literal: true

def random_group(num)
  members = ('A'..'F').to_a
  p selected_members = members.sample(num).sort
  p members - selected_members
end

random_group([2, 3].sample)
