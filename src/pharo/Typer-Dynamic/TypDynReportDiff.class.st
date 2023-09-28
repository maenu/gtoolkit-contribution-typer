Class {
	#name : #TypDynReportDiff,
	#superclass : #Object,
	#instVars : [
		'dynamic',
		'inference'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #'as yet unclassified' }
TypDynReportDiff class >> dynamic: aReport inference: anotherReport [

	^ self new
		  initializeDynamic: aReport inference: anotherReport;
		  yourself
]

{ #category : #initialization }
TypDynReportDiff >> initializeDynamic: aReport inference: anotherReport [

	dynamic := aReport.
	inference := anotherReport
]

{ #category : #accessing }
TypDynReportDiff >> merged [

	^ TypDynReport
		  package: dynamic package
		  variable: [ :v | 
			  | dyn inf |
			  dyn := dynamic variableAt: v.
			  inf := inference variableAt: v.
			  TypDynReportVariableItem new
				  clazz: v owningClass;
				  name: v name asSymbol;
				  dyn: dyn;
				  inf: inf;
				  yourself ]
		  method: [ :m | 
			  | dyn inf |
			  dyn := dynamic methodAt: m.
			  inf := inference methodAt: m.
			  TypDynReportMethodItem new
				  clazz: m methodClass;
				  name: m selector;
				  dyn: dyn;
				  inf: inf;
				  yourself ]
]

{ #category : #accessing }
TypDynReportDiff >> typGtMergedFor: aView [

	<gtView>
	^ aView forward
		  title: 'Merged';
		  priority: 1;
		  object: [ self merged ];
		  view: #typGtSummaryFor:context:
]
