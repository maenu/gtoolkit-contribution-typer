Class {
	#name : #TypCoverage,
	#superclass : #Object,
	#instVars : [
		'link'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core-Coverage'
}

{ #category : #accessing }
TypCoverage class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #accessing }
TypCoverage class >> invalidate [
	instance ifNotNil: #invalidate.
	instance := nil
]

{ #category : #accessing }
TypCoverage >> initialize [
	super initialize.
	link := MetaLink new
		metaObject: #node;
		selector: #tagExecuted;
		yourself
]

{ #category : #accessing }
TypCoverage >> instrument: aMethod [
	aMethod ast
		nodesDo: [ :n | 
			n removeProperty: #tagExecuted ifAbsent: [  ].
			((n isMessage and: [ #(#= #== #> #-) includes: n selector ]) not
				and: [ n isPragma not and: [ n isDynamicArray not ] ])
				ifTrue: [ n
						propertyAt: #tagExecuted put: false;
						link: link ] ]
]

{ #category : #accessing }
TypCoverage >> invalidate [
	link uninstall
]

{ #category : #accessing }
TypCoverage >> run [
	<gtExample>
	| package result |
	package := 'Typer-Core' asPackage.
	package methods do: #recompile.
	package methods do: #typCovInstrument.
	result := (GtExplicitExampleGroup
			withAll: 'Typer-Core-Examples' asPackage gtExamplesContained) runAll.
	link uninstall.
	^ result
]
