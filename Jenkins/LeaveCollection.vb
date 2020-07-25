Imports Microsoft.VisualBasic
Imports System.Collections
Imports System.Collections.Generic
Public Class LeaveCollection
    Private _Empnoo As Int32

    Private _LeaveRecord As List(Of String)

    Public Property empno() As Int32
        Get
            Return empno

        End Get
        Set(ByVal value As Int32)
            _Empnoo = value

        End Set
    End Property

 
    Public Property LeaveRecord() As List(Of String)
        Get
            Return _LeaveRecord
        End Get
        Set(ByVal value As List(Of String))
            _LeaveRecord = value

        End Set
    End Property
   


End Class
