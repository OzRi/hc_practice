# frozen_string_literal: true

def random_group(num)
  members = ('A'..'F').to_a
  p selected_members = members.sample(num).sort
  p members - selected_members
end

[1, 2].sample == 1 ? random_group(2) : random_group(3)
