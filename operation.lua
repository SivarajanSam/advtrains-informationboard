--event={}
--event.type = "interrupt"

interrupt(1)
place = ""
dir = nil -- either true / false
line = 0
if event.puch or event.int or event.digiline then
    avaliabletrains = F.get_train_info_by_place(place,dir) 
    x= #avaialbetrains
    if x > 1 then
        for i,v in pairs avaialbetrains do
            y=F.get_info_by_id(v)
            if y.atstn == true
                digiline_send("tv","Train at station")
            else
                digiline_send("tv2","There will be another train comming to station")
            end
        end
    elseif x ==0 then
        digiline_send(ctrler,"no more trains" )
    elseif x==1
        diigiline_send("ctrler","A train is arriving")
    end
    
end
