function onCreate()
    rabbit:setupMap(rabbit.talk, nil, nil, rabbit.walk)
    rock:setupMap(rock.mapChange2, rock.hello, rock.goodbye, nil)
    plant1:setupMap(nil, nil, nil, nil)
    plant2:setupMap(nil, nil, nil, nil)
end

function onDestroy(self)

end