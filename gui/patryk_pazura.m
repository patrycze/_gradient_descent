function varargout = patryk_pazura(varargin)
% PATRYK_PAZURA MATLAB code for patryk_pazura.fig
%      PATRYK_PAZURA, by itself, creates a new PATRYK_PAZURA or raises the existing
%      singleton*.
%
%      H = PATRYK_PAZURA returns the handle to a new PATRYK_PAZURA or the handle to
%      the existing singleton*.
%
%      PATRYK_PAZURA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PATRYK_PAZURA.M with the given input arguments.
%
%      PATRYK_PAZURA('Property','Value',...) creates a new PATRYK_PAZURA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before patryk_pazura_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to patryk_pazura_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help patryk_pazura

% Last Modified by GUIDE v2.5 23-Apr-2017 21:02:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @patryk_pazura_OpeningFcn, ...
                   'gui_OutputFcn',  @patryk_pazura_OutputFcn, ...
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


% --- Executes just before patryk_pazura is made visible.
function patryk_pazura_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to patryk_pazura (see VARARGIN)

% Choose default command line output for patryk_pazura
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes patryk_pazura wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = patryk_pazura_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
axes(handles.axes1)


function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a1 = get(handles.edit1,'String');
xp = get(handles.edit3,'String');
xk = get(handles.edit4,'String');
yp = get(handles.edit5,'String');
yk = get(handles.edit6,'String');
[i pocz roz] = gradient_prosty(a1,xp,xk,yp,yk);
set(handles.text4,'String',i)
set(handles.text3,'String',roz)

for i=1:length(pocz)-1
     line([pocz(1,i),pocz(1,i+1)],[pocz(2,i),pocz(2,i+1)])
end