Class {
	#name : #TypDynReportDiff,
	#superclass : #Object,
	#instVars : [
		'dynamic',
		'inference'
	],
	#category : #'Typer-Dynamic'
}

{ #category : #'as yet unclassified' }
TypDynReportDiff class >> dynamic: aReport inference: anotherReport [

	^ self new
		  initializeDynamic: aReport inference: anotherReport;
		  yourself
]

{ #category : #api }
TypDynReportDiff >> group: aType with: anotherType [

	aType = anotherType ifTrue: [ ^ #= ].
	aType < anotherType ifTrue: [ ^ #< ].
	aType > anotherType ifTrue: [ ^ #> ].
	^ #~=
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
			  | d i |
			  d := dynamic variableAt: v.
			  i := inference variableAt: v.
			  { 
				  (#group -> (self group: d with: i)).
				  (#dynamic -> d).
				  (#inference -> i) } asDictionary ]
		  method: [ :m | 
			  | d i |
			  d := dynamic methodAt: m.
			  i := inference methodAt: m.
			  { 
				  (#group -> (self group: d with: i)).
				  (#dynamic -> d).
				  (#inference -> i) } asDictionary ]
]
