function varargout = Create_Zip(varargin)
% CREATE_ZIP MATLAB code for Create_Zip.fig
%      CREATE_ZIP, by itself, creates a new CREATE_ZIP or raises the existing
%      singleton*.
%
%      H = CREATE_ZIP returns the handle to a new CREATE_ZIP or the handle to
%      the existing singleton*.
%
%      CREATE_ZIP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CREATE_ZIP.M with the given input arguments.
%
%      CREATE_ZIP('Property','Value',...) creates a new CREATE_ZIP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Create_Zip_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Create_Zip_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Create_Zip

% Last Modified by GUIDE v2.5 11-Dec-2016 12:35:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Create_Zip_OpeningFcn, ...
                   'gui_OutputFcn',  @Create_Zip_OutputFcn, ...
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


% --- Executes just before Create_Zip is made visible.
function Create_Zip_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Create_Zip (see VARARGIN)

% Choose default command line output for Create_Zip
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Create_Zip wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Create_Zip_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in addButton.
function addButton_Callback(hObject, eventdata, handles)
% hObject    handle to addButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
strings = get(handles.listBox1, 'String');

if isempty(strings) == 0
    idx = get(handles.listBox1, 'Value');
    
    list = get(handles.listbox2, 'String');
    
    for k=1:size(idx,2)
        id = idx(k);
        input = strings{id};
        if isempty(strmatch(input, list))
            idx2 =size(list, 1)+1;
            list{idx2,1} = input;
        end
    end
    

    set(handles.listbox2, 'String', list);
end




% --- Executes on button press in removeButton.
function removeButton_Callback(hObject, eventdata, handles)
% hObject    handle to removeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
strings = get(handles.listbox2, 'String');
if isempty(strings) == 0
    idx = get(handles.listbox2, 'Value');
    strings(idx) = [];


    set(handles.listbox2, 'Value', 1);

    set(handles.listbox2, 'String', strings);
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2
if strcmp(get(handles.figure1,'SelectionType'),'open')
    strings = get(handles.listbox2, 'String');
    if isempty(strings) == 0
        idx = get(handles.listbox2, 'Value');
        strings(idx) = [];


        set(handles.listbox2, 'Value', 1);

        set(handles.listbox2, 'String', strings);
    end
end

% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in browseButton2.
function browseButton2_Callback(hObject, eventdata, handles)
% hObject    handle to browseButton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
folder_name = uigetdir;
if folder_name ~= 0
    set(handles.createEdit,'String', folder_name);
end



function createEdit_Callback(hObject, eventdata, handles)
% hObject    handle to createEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of createEdit as text
%        str2double(get(hObject,'String')) returns contents of createEdit as a double


% --- Executes during object creation, after setting all properties.
function createEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to createEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String', pwd);




function nameEdit_Callback(hObject, eventdata, handles)
% hObject    handle to nameEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nameEdit as text
%        str2double(get(hObject,'String')) returns contents of nameEdit as a double


% --- Executes during object creation, after setting all properties.
function nameEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nameEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in createButton.
function createButton_Callback(hObject, eventdata, handles)
% hObject    handle to createButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zipfile = get(handles.nameEdit, 'String');
files = get(handles.listbox2, 'String');
rootfolder = get(handles.createEdit, 'String');
zip(zipfile,files,rootfolder);



function selectedEdit_Callback(hObject, eventdata, handles)
% hObject    handle to selectedEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of selectedEdit as text
%        str2double(get(hObject,'String')) returns contents of selectedEdit as a double


% --- Executes during object creation, after setting all properties.
function selectedEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to selectedEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.


if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String', pwd);



% --- Executes on button press in browseButton1.
function browseButton1_Callback(hObject, eventdata, handles)
% hObject    handle to browseButton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
folder_name = uigetdir;
if folder_name ~= 0

    set(handles.selectedEdit,'String', folder_name);
    listing = dir(folder_name);
    idx = find(~[listing.isdir]);
    input = {listing(idx).name};

    set(handles.listBox1,'String', input);
end




% --- Executes on selection change in listBox1.
function listBox1_Callback(hObject, eventdata, handles)
% hObject    handle to listBox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listBox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listBox1
if strcmp(get(handles.figure1,'SelectionType'),'open')
    strings = get(handles.listBox1, 'String');

if isempty(strings) == 0
    idx = get(handles.listBox1, 'Value');
    
    list = get(handles.listbox2, 'String');
    
    for k=1:size(idx,2)
        id = idx(k);
        input = strings{id};
        if isempty(strmatch(input, list))
            idx2 =size(list, 1)+1;
            list{idx2,1} = input;
        end
    end
    

    set(handles.listbox2, 'String', list);
end
end

% --- Executes during object creation, after setting all properties.
function listBox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listBox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

listing = dir(pwd);
idx = find(~[listing.isdir]);
input = {listing(idx).name};

set(hObject,'String', input);
