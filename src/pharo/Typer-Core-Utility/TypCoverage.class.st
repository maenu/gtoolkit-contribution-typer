Class {
	#name : #TypCoverage,
	#superclass : #Object,
	#instVars : [
		'link'
	],
	#category : 'Typer-Core-Utility'
}

{ #category : #accessing }
TypCoverage >> initialize [
	super initialize.
	link := MetaLink new
		metaObject: #node;
		selector: #tagExecuted;
		yourself
]

{ #category : #accessing }
TypCoverage >> run [

	<gtExample>
	| package result |
	package := 'Typer-Core' asPackage.
	package methods do: #recompile.
	package methods do: [ :m | 
		m ast nodesDo: [ :n | 
			n removeProperty: #tagExecuted ifAbsent: [  ].
			((n isMessage and: [ #( #= #== #> #- ) includes: n selector ]) not 
				 and: [ n isPragma not and: [ n isDynamicArray not ] ]) ifTrue: [ 
				n
					propertyAt: #tagExecuted put: false;
					link: link ] ] ].
	result := (GtExplicitExampleGroup withAll:
		           'Typer-Core-Examples' asPackage gtExamplesContained)
		          runAll.
	link uninstall.
	^ result
]
