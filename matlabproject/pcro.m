function varargout = pcro(varargin)
% PCRO MATLAB code for pcro.fig(matlab implemeted code doesnt work very well)
%      PCRO, by itself, creates a new PCRO or raises the existing
%      singleton*.
%
%      H = PCRO returns the handle to a new PCRO or the handle to
%      the existing singleton*.
%
%      PCRO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PCRO.M with the given input arguments.
%
%      PCRO('Property','Value',...) creates a new PCRO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pcro_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pcro_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pcro

% Last Modified by GUIDE v2.5 31-Jul-2012 15:45:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pcro_OpeningFcn, ...
                   'gui_OutputFcn',  @pcro_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

% End initialization code - DO NOT EDIT


% --- Executes just before pcro is made visible.
function pcro_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pcro (see VARARGIN)

% Choose default command line output for pcro
handles.output = hObject;
set(handles.radiobutton1,'Value',1);
set(handles.radiobutton2,'Value',0);
handles.waveform=1;
handles.frequency=10;
handles.voltage=2.5;
handles.samplingrate=44100;
handles.time=0:(1/handles.samplingrate):1;
handles.io=false;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pcro wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pcro_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
handles.waveform=get(hObject,'Value');
guidata(hObject,handles);
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton2,'Value',~get(handles.radiobutton1,'Value'));
handles.io=~get(handles.radiobutton1,'Value');
handles.io
guidata(hObject, handles);
%returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
set(handles.radiobutton1,'Value',~get(handles.radiobutton2,'Value'));
handles.io=~get(handles.radiobutton1,'Value');
guidata(hObject, handles);

% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2



function edit2_Callback(hObject, eventdata, handles)
frequency=get(hObject,'String');
handles.frequency=str2num(frequency);
guidata(hObject,handles);
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
voltage=get(hObject,'String');
handles.voltage=str2num(voltage);
guidata(hObject,handles);
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
if (handles.io==0)
handles.time=0:(1/handles.samplingrate):handles.duration;
if (handles.waveform==1)
    handles.outwave=handles.voltage*sin(2*pi*handles.frequency*handles.time);
    plot(handles.axes1,handles.outwave);
elseif (handles.waveform==2)
    handles.outwave=handles.voltage*sinc(2*pi*handles.frequency*handles.time);
    plot(handles.axes1,handles.outwave);
elseif (handles.waveform==3)
    handles.outwave=handles.voltage*square(2*pi*handles.frequency*handles.time);
    plot(handles.axes1,handles.outwave);
elseif (handles.waveform==4)
    handles.outwave=handles.voltage*sawtooth(2*pi*handles.frequency*handles.time);
    plot(handles.axes1,handles.outwave);
elseif (handles.waveform==5)
    handles.outwave=handles.voltage*sawtooth(handles.time,0.5);
    plot(handles.axes1,handles.outwave);
    handles.outwave
end
sound(handles.outwave,handles.samplingrate);
end
guidata(hObject,handles);
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function radiobutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% if (handles.io==0)
if (handles.io==1)
MaxDeviation = 3;%Maximum Allowable Change from one value to next 
TimeInterval=0.2;%time interval between each input.
loop=120;%count values
time =now;
voltage = 0;
plotHandle = plot(handles.axes1,time,voltage,'Marker','.','LineWidth',1,'Color',[1 0 1]);
xlim(handles.axes1,[min(time) max(time+0.001)]);
xlabel('Time','FontWeight','bold','FontSize',14,'Color',[1 1 0]);
ylabel('Voltage in V','FontWeight','bold','FontSize',14,'Color',[1 1 0]);
title('Real Time Data','FontSize',15,'Color',[1 1 0]);
r = audiorecorder(22050, 16, 1);
record(r);     % speak into microphone..
voltage(1)=0;
time(1)=0;
count = 2;
k=1;
starttim=tic/1000000;endtim=starttim+handles.duration;
while (starttim < endtim)
    k=k+1;  
    if k==25
       stop(r);
       record(r);
       k=0;
    end
    pause(r);   
    voltage=getaudiodata(r, 'int16');
    time(count) = count;
    set(plotHandle,'YData',voltage','XData',1:size(voltage,1));
    datetick('x','mm/DD HH:MM');
    resume(r);
    starttim=tic/1000000;
end
end
guidata(hObject,handles);


% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit4_Callback(hObject, eventdata, handles)
handles.duration=str2num(get(handles.edit4,'String'));
guidata(hObject,handles);

% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
