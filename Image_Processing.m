
function varargout = Image_Processing(varargin)
% IMAGE_PROCESSING MATLAB code for Image_Processing.fig
%      IMAGE_PROCESSING, by itself, creates a new IMAGE_PROCESSING or raises the existing
%      singleton*.
%
%      H = IMAGE_PROCESSING returns the handle to a new IMAGE_PROCESSING or the handle to
%      the existing singleton*.
%
%      IMAGE_PROCESSING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGE_PROCESSING.M with the given input arguments.
%
%      IMAGE_PROCESSING('Property','Value',...) creates a new IMAGE_PROCESSING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Image_Processing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Image_Processing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Image_Processing

% Last Modified by GUIDE v2.5 26-Dec-2021 13:16:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Image_Processing_OpeningFcn, ...
                   'gui_OutputFcn',  @Image_Processing_OutputFcn, ...
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


% --- Executes just before Image_Processing is made visible.
function Image_Processing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Image_Processing (see VARARGIN)

% Choose default command line output for Image_Processing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Image_Processing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Image_Processing_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function t_name_Callback(hObject, eventdata, handles)
% hObject    handle to t_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t_name as text
%        str2double(get(hObject,'String')) returns contents of t_name as a double


% --- Executes during object creation, after setting all properties.
function t_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t_folder_Callback(hObject, eventdata, handles)
% hObject    handle to t_folder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t_folder as text
%        str2double(get(hObject,'String')) returns contents of t_folder as a double


% --- Executes during object creation, after setting all properties.
function t_folder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_folder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in select.
function select_Callback(hObject, eventdata, handles)
      data = zeros(3,3);
      set(handles.Filter,'Data',data);
     [name ,file]= uigetfile('*.tif;*.png;*.jpg;*.gif;*.bmp;*.raw', 'select New Image');
       % p1.png  E:\   E:\p1.png   m1 m2 =  m1+m2
     
     if isequal(name,0) && isequal(file,0)
     else
         %c:\car.tif   imwrite (img ,path, type)
         
         path = strcat(file , name);
         img = imread(path);
         
         % car.tif
         type = name(strfind(name,'.')+1:end);

         axes(handles.OriginImage);
         set(handles.OriginImage,'Visible','On');
         imshow(img);
         
         set(handles.t_name,'String',name);
         set(handles.t_folder,'String',file);
         set(handles.Mainlist,'enable','on');
         
         handles.Oimg = img;
         handles.Name = name;
         handles.Type = type;
         guidata(hObject, handles);
     end
     
% hObject    handle to select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
    op = questdlg('Are You Sure','Exit','Yes','No','No');
    switch op
        case "Yes"
            close
        case "No"
    end
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in restore.
function restore_Callback(hObject, eventdata, handles)
 
   axes(handles.ModifiedImage);
   cla
% hObject    handle to restore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cont.
function cont_Callback(hObject, eventdata, handles)
% hObject    handle to cont (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
     img = handles.Mimg;
     type = handles.Type;
     Dname = handles.Name; %Default name
     
     Dpath = 'E:\4th year\Imaging Processing\Tasks\Project\' ;  % Default path
     
     input = {'Name','Path'};
     def={Dname ,Dpath};
     out = inputdlg(input,'Save As',[1 50],def);
       
     path = strcat(out{2},out{1});
     imwrite(img,path,type);
     
     if isequal(Dpath , out{2})
         msgbox({'File saved in the defualt path',Dpath},'Save Image');
     else
         msgbox({'File saved in the selected path',['Path : ',out{2}]},'Save Image');
     end
     set(handles.save,'enable','off');
    
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on selection change in Mainlist.
function Mainlist_Callback(hObject, eventdata, handles)
      
      set(handles.Sublist,'enable','on');
      Data = get(handles.Mainlist,'String');
      DataItemNo = get(handles.Mainlist,'value');
      
      
      set(handles.Filter,'enable','off');
      set(handles.resize,'enable','off');
      
      switch Data{DataItemNo}
          case 'Brightness'
              set(handles.Sublist,'String',[]);
              set(handles.Sublist,'String',{'Add','Sub','Mul','Div'});
              set(handles.do,'enable','on');
              
          case 'Spatial Domain Filters'
              set(handles.Sublist,'String',[]);
              set(handles.Sublist,'String',{'Mean','Wight','Point Detection','Point Sharpening',...
                  'Line Detection','Line Sharpening','Min','Max','Median', 'MedPoint'});
          
          case 'Frequency Domain Filters'
              set(handles.Sublist,'String',[]);
              set(handles.Sublist,'String',{'ILPF','IHPF','BWLPF','BWHPF','GLPF','GHPF'});
             

          case 'Noise'
             set(handles.Sublist,'String',[]);
             set(handles.Sublist,'String',{'Salt & Pepper','Gaussian','Gamma','Exponential','Rayleigh','Uniform'});
          
          otherwise
              set(handles.Sublist,'String','None');
              set(handles.Sublist,'enable','off');
              set(handles.do,'enable','on');
      end
      
    
      
      
    
   
% hObject    handle to Mainlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Mainlist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Mainlist


% --- Executes during object creation, after setting all properties.
function Mainlist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mainlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Sublist.
function Sublist_Callback(hObject, eventdata, handles)

      Data = get(handles.Sublist,'String');
      DataItemNo = get(handles.Sublist,'value');
      Data2 = get(handles.Mainlist,'String');
      DataItemNo2 = get(handles.Mainlist,'value');
      set(handles.do,'enable','on');
      
      %filters = ['Min','Max','Median', 'MedPoint'];
      op = Data{DataItemNo};
      
      if Data2{DataItemNo2} == "Spatial Domain Filters"
          if  (op== "Min" ||op== "Max" ||op== "Median" ||op== "MedPoint" )
                  set(handles.Filter,'enable','off');
                  set(handles.resize,'enable','off');
                  
                 
                  
          else
                  set(handles.Filter,'enable','on');
                  set(handles.resize,'enable','on');
          end
      else
          set(handles.Filter,'enable','off');
          set(handles.resize,'enable','off');
      end
    


% hObject    handle to Sublist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Sublist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Sublist


% --- Executes during object creation, after setting all properties.
function Sublist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sublist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end









% --- Executes on button press in resize.
function resize_Callback(hObject, eventdata, handles)
     
     rows = 3;
     colunms = 3;
     input = {'Rows','Colunms'};
     
     R = questdlg('Resize table....','Options','New','Default','Default');
         % questdlg(text,name,'b1','b2','b') 
         
     if R == "New"
       out = inputdlg(input,'Resize Table',[1 40]);
       rows = str2double(out{1});
       colunms = str2double(out{2});
     end
     data=zeros(rows,colunms);
     
     set(handles.Filter,'Data',data);
     
     
     
     
% hObject    handle to resize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in do.
function do_Callback(hObject, eventdata, handles)
      
      img = handles.Oimg;
      out= img; 
      Mlist = get(handles.Mainlist,'String');
      MItem_click = get(handles.Mainlist,'value');
      
      Slist = get(handles.Sublist,'String');
      SItem_click = get(handles.Sublist,'value');
      
      val1 = str2double(get(handles.val1,'string'));
      val2 = str2double(get(handles.val2,'string'));
      
      mask = (get(handles.Filter,'data'));
      %disp(mask);
      
       
      
      
%       if (Mop =="Rgb To Gray" || Mop =="Negative"||Mop =="Log"||Mop =="Histogram" )
%           
%       else if
%       end
      set(handles.ModifiedImage,'Visible','On');
      axes(handles.ModifiedImage);
                 
      switch Mlist{MItem_click}
          case "Rgb To Gray"
                 out =rgb2gray_f(img);
                 imshow(out);
          case "Rgb To Binary"
                 in = val1;
                 out = rgb2binary_f(img,in); 
                 imshow(out);
          case "Gray To Binary"
                 in = val1;
                 out = gray2binary_f(img,in);  
                 imshow(out);
          case "Negative"
                 out=negative_f(img);
                 imshow(out);
          case "Histogram"
                 out =histogram_f(img);
                 bar( out);
          case "Contrast Stretching"
                 s1=val1;
                 s2=val2;
                 out=rgb_or_gray_stretching(img,s1,s2);
                 imshow(out);
          case "Log"
                 out=Logarithmic(img);
                 imshow(out);
          case "Gamma"
                  in = val1;
                  out=Power_low_gamma(img,in);
                  imshow(out);
          case "Histogram Equalization"
                  out= histEq(img);
                  bar(out);
                  
              
      end
      
      switch Slist{SItem_click}
          case "Add"
                 out =rgb_or_gray__brightness(img,'+',val1);
                 imshow(out);
          case "Sub"
                 out =rgb_or_gray__brightness(img,'-',val1);
                 imshow(out);
          case "Mul"
                out =rgb_or_gray__brightness(img,'*',val1);
                imshow(out);
          case "Div"
                 out =rgb_or_gray__brightness(img,'/',val1);
                 imshow(out);
          case "Min"
                out = nonlinearmasks(img,val1,'min');
                imshow(out);
          case "Max"
                 out = nonlinearmasks(img,val1,'max');
                 imshow(out);
          case "MedPoint"
                 min = nonlinearmasks(img,val1,'min');
                 max = nonlinearmasks(img,val1,'max');
                 out= 0.5*max + min;
                 imshow(out);
          case "Median"
                  out = nonlinearmasks(img,val1,'med');
                  imshow(out);
          case "Mean" 
                if mask == 0
                    mask = (1/(9))*ones(3,3);
                end
                out = maskFilter(img,mask);
                imshow(out);
                
          case "Wight"
                if mask == 0
                    mask = [4 5 8 ; 5 3 7; 9 3 1];
                end
                out = maskFilter(img,mask);
                imshow(out);
          case "Point Detection"
               if mask == 0
                    mask=[1 1 1;1 -8 1;1 1 1];
                end
                out = maskFilter(img,mask);
                imshow(out);
          case "Point Sharpening"
                if mask == 0
                    mask=[1 1 1;1 -8 1;1 1 1];
                end
                out = maskFilter(img,mask)+img;
                imshow(out);
          case "Line Detection"
                out = lineDetection(img,1);
                imshow(out);
          case "Line Sharpening"
                out = lineDetection(img,1)+img;
                imshow(out);
          case "ILPF"
                    out =low_high_pass_filter(img,val1,1,0);
                    imshow(out);
          case "IHPF"
                    out =low_high_pass_filter(img,val1,1,1);
                    imshow(out);
          case "BWLPF"
                    out =low_high_pass_filter(img,val1,2,0);
                    imshow(out);
          case "BWHPF"
                    out =low_high_pass_filter(img,val1,2,1);
                    imshow(out);
          case "GLPF"
                    out =low_high_pass_filter(img,val1,3,0);
                    imshow(out);
          case "GHPF"
                    out =low_high_pass_filter(img,val1,3,1);
                    imshow(out);
          case "Salt & Pepper"
                    out = SaltAndPapperNoise(img,val1,val2);
                    imshow(out);
          case "Gaussian"
                    out = GaussianNoise(img,val1,val2);
                    imshow(out);
          case "gamma"
                    out = gammaNoise(img,0.0003,val1);
                    imshow(out);
          case "Exponential"
                    out = ExponentialNoise(img,val1);
                    imshow(out);
          case "Rayleigh"
                    out =RayleighNoise(img,val1,val2);
                    imshow(out);
          case "Uniform"
                    out = UniformNoise(img,val1,val2);
                    imshow(out);
      end
      
      handles.Mimg= out;
      guidata(hObject, handles);
      set(handles.save,'enable','On');
      
      
     
% hObject    handle to do (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in Filter.
function Filter_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to Filter (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)



function val1_Callback(hObject, eventdata, handles)
% hObject    handle to val1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of val1 as text
%        str2double(get(hObject,'String')) returns contents of val1 as a double


% --- Executes during object creation, after setting all properties.
function val1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to val1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function val2_Callback(hObject, eventdata, handles)
% hObject    handle to val2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of val2 as text
%        str2double(get(hObject,'String')) returns contents of val2 as a double


% --- Executes during object creation, after setting all properties.
function val2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to val2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function restore_CreateFcn(hObject, eventdata, handles)
% hObject    handle to restore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
