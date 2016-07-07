def game_hash
 {
  home:
  {team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: {
      "Alan Anderson" =>
      {number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      },

      "Reggie Evans" =>
      {number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
      },

      "Brook Lopez" =>
      {number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      },

      "Mason Plumlee" =>
      {number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
      },

      "Jason Terry" =>
      {number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
      }
    }
  },

  away:
   {team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: {
      "Jeff Adrien" =>
      {number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      },

      "Bismak Biyombo" =>
      {number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10
      },

      "DeSagna Diop" =>
      {number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
      },

      "Ben Gordon" =>
      {number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
      },

      "Brendan Haywood" =>
      {number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 22,
        blocks: 5,
        slam_dunks: 12
      }
    }
  }
}
end

def num_points_scored(name)
value = 0
game_hash.each do |k1, v1|
  v1.each do |k2, v2|
    if k2.to_s == "players"
    v2.each do |k3, v3|
      if k3 == name
        value = v3[:points]
    end
  end
end
end
end
value
end

def shoe_size(name)
value2 = 0
game_hash.each do |k1, v1|
  v1.each do |k2, v2|
    if v2.class == Hash
      v2.each do |k3, v3|
        if k3.to_s == name
          value2 = v3[:shoe]
      end
    end
  end
end
end
value2
end

def team_colors(name)
game_hash.each do |k1, v1|
  v1.each do |k2, v2|
    if v2 == name
      return v1[:colors]
      end
    end
  end
end

def team_names
array = []
game_hash.each do |k1, v1|
 array << v1[:team_name].to_s
  end
array.flatten
end

def player_numbers(name)
numbers_array = []
game_hash.each do |k1, v1|
  v1.each do |k2, v2|
    if v2 == name
      v1[:players].each do |k3, v3|
        numbers_array << v3[:number]
      end
    end
  end
end
numbers_array.flatten
end

def player_stats(name)
  game_hash.each do |k1, v1|
    v1.each do |k2, v2|
      if v2.class == Hash
        v2.each do |k3, v3|
          if k3 == name
            return v3
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  shoe_no = 0
  biggest_rebound = 0
  game_hash.each do |k1, v1|
    v1.each do |k2, v2|
      if k2.to_s == "players"
        v2.each do |k3, v3|
              if v3[:shoe] > shoe_no
                shoe_no = v3[:shoe]
              end
            end
          end
        end
      end
game_hash.each do |j1, u1|
  u1.each do |j2, u2|
    if u2.class == Hash
      u2.each do |j3, u3|
        if u3[:shoe] == shoe_no
          biggest_rebound = u3[:rebounds]
        end
      end
    end
  end
end
biggest_rebound
end

def most_points_scored
most_points = 0
person_array = []
game_hash.each do |k1, v1|
  v1.each do |k2, v2|
    if v2.class == Hash
      v2.each do |k3, v3|
        if v3[:points] > most_points
        most_points = v3[:points]
      end
    end
  end
end
end
game_hash.each do |j1, u1|
  u1.each do |j2, u2|
    if u2.class == Hash
      u2.each do |j3, u3|
        if u3[:points] == most_points
          person_array << j3
        end
      end
    end
  end
end
person_array.flatten.first
end

def winning_team
winning_team = ""
max_score = 0
  game_hash.each do |k1, v1|
    temp_score = 0
    v1.each do |k2, v2|
      if k2 == :players
        v2.each do |k3, v3|
          temp_score += num_points_scored(k3)
        end
      end
    end
    if temp_score > max_score
      winning_team = v1[:team_name]
      max_score = temp_score
    end
  end
  winning_team
end

def player_with_longest_name
  long_name = ""
  game_hash.each do |k1, v1|
    v1[:players].each do |k2, v2|
      if k2.length > long_name.length
        long_name = k2
      end
    end
  end
  long_name
end

def long_name_steals_a_ton?
long_name = ""
max_steal = 0
person_array = []
  game_hash.each do |k1, v1|
    v1[:players].each do |k2, v2|
      if k2.length > long_name.length
        long_name = k2
      end
    end
  end
  game_hash.each do |k1, v1|
    v1.each do |k2, v2|
      if v2.class == Hash
        v2.each do |k3, v3|
          if v3[:steals] > max_steal
          max_steal = v3[:steals]
        end
      end
    end
  end
  end
  game_hash.each do |j1, u1|
    u1.each do |j2, u2|
      if u2.class == Hash
        u2.each do |j3, u3|
          if u3[:steals] == max_steal
            person_array << j3
          end
        end
      end
    end
  end
  if person_array.flatten.first == long_name
    true
  end
end
