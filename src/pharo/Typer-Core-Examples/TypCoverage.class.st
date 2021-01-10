Class {
	#name : #TypCoverage,
	#superclass : #Object,
	#instVars : [
		'link'
	],
	#category : #'Typer-Core-Examples'
}

{ #category : #accessing }
TypCoverage >> executed: aNode [
	aNode propertyAt: #typExecuted put: true
]

{ #category : #accessing }
TypCoverage >> initialize [
	super initialize.
	link := MetaLink new
		metaObject: self;
		selector: #executed:;
		arguments: #(node);
		yourself
]

{ #category : #accessing }
TypCoverage >> run [
	<gtExample>
	| package |
	package := 'Typer-Core' asPackage.
	package methods
		do: [ :m | 
			m ast
				nodesDo: [ :n | 
					n removeProperty: #typExecuted ifAbsent: [  ].
					(n isMessage or: n isReturn)
						ifTrue: [ n
								propertyAt: #typExecuted put: false;
								link: link ] ] ].
	(GtExplicitExampleGroup
		withAll: 'Typer-Core-Examples' asPackage gtExamplesContained) runAll.
	link uninstall
]
