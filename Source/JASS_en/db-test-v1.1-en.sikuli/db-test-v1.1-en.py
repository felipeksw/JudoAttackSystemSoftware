## 
file_sequence_action = "db_randon_events_lote_01.txt";

##
app_icon = Pattern("app_icon.png").similar(0.85)
register = Pattern("register.png").similar(0.85)
play = Pattern("play.png").similar(0.85)
pause = Pattern("pause.png").similar(0.85)
clear_tab = Pattern("clear_tab.png").similar(0.85)
ok = Pattern("ok.png").similar(0.85)
registration = Pattern("registration.png").similar(0.85)
analysis_name = Pattern("analysis_name.png").similar(0.85).targetOffset(-30,20)
video_name = Pattern("video_name.png").similar(0.85).targetOffset(35,0)
dialogue_icon = Pattern("dialogue_icon.png").similar(0.85)
dialogue_open = Pattern("dialogue_open.png").similar(0.85)
open_video = Pattern("open_video.png").similar(0.85)
add_analysis = Pattern("add_analysis.png").similar(0.85)
save_changes = Pattern("save_changes.png").similar(0.85)
refereeing = Pattern("refereeing.png").similar(0.85)
hajime = Pattern("hajime.png").similar(0.85)
mate = Pattern("mate.png").similar(0.85)
golden_score = Pattern("golden_score.png").similar(0.85)
sore_made = Pattern("sore_made.png").similar(0.85)
ippon = Pattern("ippon.png").similar(0.85)
waza_ari = Pattern("waza_ari.png").similar(0.85)
no_score = Pattern("no_score.png").similar(0.85)
winning = Pattern("winning.png").similar(0.85)
losing = Pattern("losing.png").similar(0.85)
tied = Pattern("tied.png").similar(0.85)
displacement = Pattern("displacement.png").similar(0.85)
tori_approach = Pattern("tori_approach.png").similar(0.85)
uke_approach = Pattern("uke_approach.png").similar(0.85)
final_approach = Pattern("final_approach.png").similar(0.85)
right_foot_forward = Pattern("right_foot_forward.png").similar(0.85)
left_foot_forward = Pattern("left_foot_forward.png").similar(0.85)
parallel_base = Pattern("parallel_base.png").similar(0.85)
previous_displacement = Pattern("previous_displacement.png").similar(0.85)
forward = Pattern("forward.png").similar(0.85)
backward = Pattern("backward.png").similar(0.85)
to_the_right = Pattern("to_the_right.png").similar(0.85)
to_the_left = Pattern("to_the_left.png").similar(0.85)
circular_right = Pattern("circular_right.png").similar(0.85)
circular_left = Pattern("circular_left.png").similar(0.85)
no_displacement = Pattern("no_displacement.png").similar(0.85)
stance_direction = Pattern("stance_direction.png").similar(0.85)
ai_yotsu_right = Pattern("ai_yotsu_right.png").similar(0.85)
ai_yotsu_left = Pattern("ai_yotsu_left.png").similar(0.85)
kenka_yotsu_right = Pattern("kenka_yotsu_right.png").similar(0.85)
kenka_yotsu_left = Pattern("kenka_yotsu_left.png").similar(0.85)
forward_right = Pattern("forward_right.png").similar(0.85)
forward_left = Pattern("forward_left.png").similar(0.85)
back_right = Pattern("back_right.png").similar(0.85)
back_left = Pattern("back_left.png").similar(0.85)
grip = Pattern("grip.png").similar(0.85)
r_collar = Pattern("r_collar.png").similar(0.85)
r_sleeve = Pattern("r_sleeve.png").similar(0.85)
r_cross_collar = Pattern("r_cross_collar.png").similar(0.85)
r_cross_sleeve = Pattern("r_cross_sleeve.png").similar(0.85)
r_dorsal_up = Pattern("r_dorsal_up.png").similar(0.85)
r_dorsal_down = Pattern("r_dorsal_down.png").similar(0.85)
r_armhole = Pattern("r_armhole.png").similar(0.85)
r_no_grip = Pattern("r_no_grip.png").similar(0.85)
l_collar = Pattern("l_collar.png").similar(0.85)
l_sleeve = Pattern("l_sleeve.png").similar(0.85)
l_cross_collar = Pattern("l_cross_collar.png").similar(0.85)
l_cross_sleeve = Pattern("l_cross_sleeve.png").similar(0.85)
l_dorsal_up = Pattern("l_dorsal_up.png").similar(0.85)
l_dorsal_down = Pattern("l_dorsal_down.png").similar(0.85)
l_armhole = Pattern("l_armhole.png").similar(0.85)
l_no_grip = Pattern("l_no_grip.png").similar(0.85)

##################################################
##################################################

from datetime import datetime

seqFile = open(file_sequence_action, "r")
#logFile = open(file_sequence_action + '.log', "w+")

app_pos = find(app_icon)
app_posX = app_pos.getX()-2
app_posY = app_pos.getY()-2
app_posW = 800
app_posH = 630
reg = Region(app_posX, app_posY, app_posW, app_posH)
#reg.highlight()
#wait(1)
#reg.highlight()

now = datetime.now()
print('S: '+now.strftime("%d/%m/%Y %H:%M:%S"))

lines = seqFile.readlines();

for line in lines:

    if not line.lower().strip(): continue
    
    cmd = line.split('.',1)
    
    if cmd[0].lower() == 'wait':
        # ARRUMAR ESSA VALIDACAO
        try:
            wait(int(cmd[1].strip()))
            #print('wait:' + cmd[1])
        except:
            #logFile.write('Attribute is not a number. Line X not executed: ' + line)
            print('Attribute is not a number. Line X not executed: ' + line)            
    elif cmd[0].lower() == 'region':
        try:
            if cmd[1].lower().strip() == 'app':
                reg.setX(app_posX)
                reg.setY(app_posY)
                reg.setW(app_posW)
                reg.setH(app_posH)
            else:
                attr = cmd[1].split('=')
                pnts = attr[1].split(',')
                #print(attr[0].lower().strip())
                icon_pos = find(eval(attr[0].lower().strip()))
                reg.setX(icon_pos.getX()-int(pnts[0]))
                reg.setY(icon_pos.getY()-int(pnts[1]))
                reg.setW(int(pnts[2]))
                reg.setH(int(pnts[3]))
                #reg.highlight()
                #wait(1)
                #reg.highlight()
        except Exception as e:
            #logFile.write('[ERROR] Error to select a new region, line not executed: ' + line)
            print('[ERROR] Error to select a new region, line not executed: ' + line)
            print(e)
    elif cmd[0].lower() == 'click':
        try:
            reg.click(eval(cmd[1].lower().strip()))
        except Exception as e:
            #logFile.write('[ERROR] Image not found, line not executed: ' + line)
            print('Image not found. Line not executed: ' + line)
            print(e)
    elif cmd[0].lower() == 'type':
        try:
            attr = cmd[1].split('=')
            reg.click(eval(attr[0].lower().strip()))
            reg.type(attr[1].strip())
        except Exception as e:
            print('[ERROR] no TYPE: ' + line)
            print(e)
    elif cmd[0].lower() == 'key':
        try:
            if (cmd[1].find('=') != -1):
                attr = cmd[1].split('=')
                reg.type(attr[1].strip(), eval('Key.'+attr[0].strip()))
            else:               
                reg.type(eval('Key.'+cmd[1].strip()))
        except Exception as e:
            print('[ERROR] no KEY: ' + line)
            print(e)
    elif cmd[0].lower() == 'comment':
        try:
            print(cmd[1]);
        except Exception as e:
            print('[ERROR] no COMMENT: ' + line)
            print(e)        
    else:
        #logFile.write('[ERROR] Action not found, line not executed: ' + line)
        print('Action not found. Line not executed: ' + line)

seqFile.close()
#logFile.close()

now = datetime.now()
print('E: '+now.strftime("%d/%m/%Y %H:%M:%S"))