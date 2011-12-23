def splat(* args)
  p "#{args.length}: #{args}"
end

splat 1, 2, 3, 4 # 4: [1, 2, 3, 4]

def var(args)
  p "#{args.inspect}"
end

var "1" => "2", "3" => "4" # { "1" => "2", "3" => "4" }


