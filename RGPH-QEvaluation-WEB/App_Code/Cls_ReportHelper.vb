Imports Microsoft.Reporting.WebForms
Imports System
Imports System.Collections
Imports System.Collections.Generic


Public Class Cls_ReportHelper
    Private _NumberofParameter As Long = 0
    Private _reportFolderPath As String
    Private _reportName As String
    Private _storedProcedureName As String
    Private _StoredProcedureParameters As ArrayList
    Private _hasSubreport As Boolean

    Public SubReport As Cls_ReportHelper
    Public DrillThrough As Cls_ReportHelper
    Private _isdirty As Boolean = False

    Public Class StoredParameter
        Public Name As String
        Public Value As Long
    End Class

    Private _listofParameter As New List(Of StoredParameter)
    Private _listofSubreport As New List(Of Cls_ReportHelper)
    Private _listofDrillTroughReport As New List(Of Cls_ReportHelper)

    Public Property ReportFolderPath As String
        Get
            Return _reportFolderPath
        End Get
        Set(ByVal Value As String)
            If LCase(Trim(_reportFolderPath)) <> LCase(Trim(Value)) Then
                _isdirty = True
                _reportFolderPath = Trim(Value)
            End If
        End Set
    End Property

    Public Property ReportName As String
        Get
            Return _reportName
        End Get
        Set(ByVal Value As String)
            If LCase(Trim(_reportName)) <> LCase(Trim(Value)) Then
                _isdirty = True
                _reportName = Trim(Value)
            End If
        End Set
    End Property

    Public Property StoredProcedureName As String
        Get
            Return _storedProcedureName

        End Get
        Set(ByVal Value As String)
            If LCase(Trim(_storedProcedureName)) <> LCase(Trim(Value)) Then
                _isdirty = True
                _storedProcedureName = Trim(Value)
            End If
        End Set
    End Property

    Public Property HasSubreport() As Boolean
        Get
            Return _hasSubreport
        End Get
        Set(ByVal Value As Boolean)
            If _hasSubreport <> Value Then
                _isdirty = True
                _hasSubreport = Value
            End If
        End Set
    End Property

    Public ReadOnly Property NumberofParameter As Long
        Get
            Return _NumberofParameter
        End Get
    End Property

    Public ReadOnly Property ListofParameter As List(Of StoredParameter)
        Get
            Return _listofParameter
        End Get
    End Property

    Public ReadOnly Property ListofSubReport As List(Of Cls_ReportHelper)
        Get
            Return _listofSubreport
        End Get
    End Property

    Public ReadOnly Property ListofDrillTroughReport As List(Of Cls_ReportHelper)
        Get
            Return _listofDrillTroughReport
        End Get
    End Property

    Public Sub SetParameter(ByVal parametername As String, ByVal parametervalue As Long)
        Try
            Dim obj As New StoredParameter
            With obj
                .Name = parametername
                .Value = parametervalue
            End With
            _listofParameter.Add(obj)
            _NumberofParameter = _NumberofParameter + 1
        Catch ex As Exception

        End Try
    End Sub


End Class
