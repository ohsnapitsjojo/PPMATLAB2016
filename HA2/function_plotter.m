function varargout = function_plotter(varargin)
% FUNCTION_PLOTTER M-file for function_plotter.fig
%      FUNCTION_PLOTTER, by itself, creates a new FUNCTION_PLOTTER or raises the existing
%      singleton*.
%
%      H = FUNCTION_PLOTTER returns the handle to a new FUNCTION_PLOTTER or the handle to
%      the existing singleton*.
%
%      FUNCTION_PLOTTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FUNCTION_PLOTTER.M with the given input arguments.
%
%      FUNCTION_PLOTTER('Property','Value',...) creates a new FUNCTION_PLOTTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before function_plotter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to function_plotter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help function_plotter

% Last Modified by GUIDE v2.5 13-Nov-2016 11:18:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @function_plotter_OpeningFcn, ...
                   'gui_OutputFcn',  @function_plotter_OutputFcn, ...
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


% --- Executes just before function_plotter is made visible.
function function_plotter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to function_plotter (see VARARGIN)

% Choose default command line output for function_plotter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes function_plotter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = function_plotter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Frequency_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Frequency_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Frequency_edit as text
%        str2double(get(hObject,'String')) returns contents of Frequency_edit as a double


% --- Executes during object creation, after setting all properties.
function Frequency_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Frequency_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Amplitude_Edit_Callback(hObject, eventdata, handles)
% hObject    handle to Amplitude_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Amplitude_Edit as text
%        str2double(get(hObject,'String')) returns contents of Amplitude_Edit as a double


% --- Executes during object creation, after setting all properties.
function Amplitude_Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Amplitude_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Phase_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Phase_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Phase_edit as text
%        str2double(get(hObject,'String')) returns contents of Phase_edit as a double
phi = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function Phase_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Phase_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in plot_function.
function plot_function_Callback(hObject, eventdata, handles)
% hObject    handle to plot_function (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

colors = get(handles.popupmenu_color,'String');
color = char(colors(get(handles.popupmenu_color,'Value')));

lineStyles = get(handles.popupmenu_style,'String');
lineStyle = char(lineStyles(get(handles.popupmenu_style,'Value')));

phi = str2double(get(handles.Phase_edit,'String'));
A = str2double(get(handles.Amplitude_Edit,'String'));
f = str2double(get(handles.Frequency_edit,'String'));
x = [0:0.01:10];
y = A*sin(2*pi*f*x+phi*pi/180);

if strcmp(lineStyle,'solid')
    style = '-';
elseif strcmp(lineStyle,'dashed')
    style = '--';
elseif strcmp(lineStyle,'dotted')
    style = ':';
end

hold on;
line('xdata',x,'ydata',y,'color',color,'LineStyle',style);
hold off;


% --- Executes on button press in clear_axes.
function clear_axes_Callback(hObject, eventdata, handles)
% hObject    handle to clear_axes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over plot_function.
function plot_function_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to plot_function (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu_color.
function popupmenu_color_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_color contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_color



% --- Executes during object creation, after setting all properties.
function popupmenu_color_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_style.
function popupmenu_style_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_style (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_style contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_style


% --- Executes during object creation, after setting all properties.
function popupmenu_style_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_style (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_grid.
function checkbox_grid_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_grid
if get(hObject,'Value')
    grid on;
else
    grid off;
end

% --- Executes on button press in checkbox_box.
function checkbox_box_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_box
if get(hObject,'Value')
    box on;
else
    box off;
end
