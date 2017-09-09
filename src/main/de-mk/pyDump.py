import idaapi
import time
import os

def writeDumpToFile(start_address, end_address):
    data_length = end_address - start_address
    data = idaapi.dbg_read_memory(start_address, data_length)

    dt = str(time.strftime('%Y%m%d%H%M%S',time.localtime()))
    dir = 'F:\\workspace\\009-dededark_attempt001\\ida-wk\\dump\\'+dt[0:8]
    
    try:
        os.mkdir(dir)#,0o777)
    except:
        pass
    bpt = idaapi.get_screen_ea()    #get_event_exc_ea()
    fname = dir +'\\dump_' +hex(bpt)+'_'+ hex(start_address) +'_to_'+ hex(end_address) +'_'+dt+'.dex.bin'
    fp = open(fname, 'wb')

    fp.write(data)
    fp.write('\n\nstart at: '+hex(start_address)+'\n\n')
    fp.write('\n\nend at: '+hex(end_address)+'\n\n')
    fp.close()



start_addr  = 0xc5eeb8
end_addr    = 0xc5f6b8
writeDumpToFile(start_addr, end_addr)

start_addr  = 0xca8cf0
end_addr    = 0xca8ff0    #;9088 #ca9088 ca9050+38h
writeDumpToFile(start_addr, end_addr)

start_addr  = 0xca8ff0
end_addr    = 0xca9030
writeDumpToFile(start_addr, end_addr)

start_addr  = 0xca9030
end_addr    = 0xca9088
writeDumpToFile(start_addr, end_addr)
