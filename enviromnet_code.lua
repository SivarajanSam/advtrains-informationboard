--[[

    this is to be written to a lua ATC environment
F.trains Table values:
    -id - train Atc_id
    -place - the place where train is / the station nearby
    -dir - going direction true/false. 
    -atstn- determines whether the train is at station
    -line - train line number

]]


--F = {}
F.depot= false
F.train = {id = {}, place={},line={},dir={},atstn={}} --a table to store all train data

F.find_train_by_id = function (idn) -- this function retruns index of train data
    for i,v in pairs(f.train.id)do
        if idn == v then
            return i
        else
            return -1
        end
    end
end
F.update_train_info= function(tid, loc,tline,direction,stn)  -- this is to overwrite train info
    x = F.find_train_by_id(tid) --we find train info
    if x == -1 then -- -1 means info is absent
        F.train.id[#F.train.id+1]=tid --appending infos
        F.train.place[#F.train.place+1]=loc
        if tline<=99 then F.train.line[#F.train.line+1]=tline end
       if dir == true or dir == false then  F.train.dir[#F.dir.line+1]=direction else error("Invalid info") end
        if stn == true or stn == false then  F.train.dir[#F.train.line+1]=direction else error("Invalid info")   end
    else
        F.train.place[x]=loc
        if tline<=99 then F.train.line[x]=tline else error("Invalid info") end
       if dir == true or dir == false then  F.train.dir[x]=direction else error("Invalid info")  end
    end
end

F.get_info_by_place = function(loc,fdir) -- to get table of trains that are there in a particular station/ near by station
    id = {}
    for i,v in pairs(F.train.place)do
        if v == loc  and F.train.dir[i]== fdir and F.train.atstn[i] == true then
            id[#id+1]=F.train.id[i]
        end
        return id
    end
end
F.get_info_by_id= function(id) --returns info of particular train
    x= F.find_train_by_id(id)
    if not x == -1 then
        y= {place=F.train.place[x],dir=F.train.dir[x],atstn=F.train.atstn[x],line =F.train.line[x]}
        return y
    else
        error("Train Not found")
    end
end

F.cleartable = function() -- handy function to clean the table for reset
    F.train = nil
    F.train = {id = {}, place={},line={},dir={},atstn={}}
end
