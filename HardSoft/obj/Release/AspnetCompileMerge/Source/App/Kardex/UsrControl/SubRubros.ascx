<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubRubros.ascx.cs" Inherits="HardSoft.App.Kardex.UsrControl.SubRubros" %>
   
     <div  >  
    <div style="margin-top:0px;text-transform:uppercase"  >
    
       

          

        <div class="row" style="font-size:14px;">
        <div class="col-md-6">

   <div class="row" style="  margin-left:0px; margin-right:0px;   padding:5px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
          <div class="col-sm-12" style="margin-top:10px; margin-right: 0px;" > 
<div style="text-align:left" class="alert alert-info">RUBROS</div>

    <div id='Resultado' style="overflow-y: auto; overflow-x: hidden; height: 280px; width: 100%; ">
        
        <div   >


        </div>
  <table   id='grilla'></table>

</div>
              </div>
     </div>
        </div>
    
        <div class="col-md-6">

   <div class="row" style="margin-left:0px; margin-right:0px;   padding:5px;border-radius: 10px 10px 10px 10px;border: 1px solid;box-shadow: 0 4px 5px #555; text-align:center;">
         
        <div class="col-sm-12" style="margin-top:10px; margin-right: 0px;" > 
            <div style="text-align:left" class="alert alert-info">SUB RUBROS</div>
    <div id='Resultado2' style="overflow-y: auto; overflow-x: hidden; height: 280px; width: 100%; ">
          <div class="wait" style=" margin:auto;  padding:2px;"><img src='/images/Loading_icon.gif'    width="110"/><br>Loading..</div>
        
         <div   >

           
         
         </div>
  <table   id='grilla2'></table>

</div>
              </div>
     </div>
        </div>
    </div>


        </div>


       <div   style="  background-color:#333 ;border-radius: 10px 10px 10px 10px;
border: 1px solid;
box-shadow: 0 4px 5px #555; text-align:center; padding-top:10px ; padding-left:10px; padding-right:10px" >

           <div class="row ">
                <div class="col-xs-6"">
               <div class="form-horizontal">        
          <div class="form-group">
        
              <label for="TxtNombre" class="control-label col-xs-4" style="color:white;font-weight:700">Buscar Rubro </label>
         
              <div class="col-xs-8">
              <input type="text" id="kwd_search" value="" class="form-control"/>
             </div>
              </div>
               </div>
         </div>

                <div class="col-xs-6"">
               <div class="form-horizontal">        
          <div class="form-group">
        
              <label for="TxtNombre" class="control-label col-xs-4" style="color:white;font-weight:700">Buscar SubRubro </label>
         <div class="col-xs-8">
              <input type="text" id="kwd_search2" value="" class="form-control"/>
             </div>
              </div>
               </div>
         </div>
       
          </div>
               </div>  
   

         </div>
