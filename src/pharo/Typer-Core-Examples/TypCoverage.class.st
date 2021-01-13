Class {
	#name : #TypCoverage,
	#superclass : #Object,
	#instVars : [
		'link'
	],
	#category : #'Typer-Core-Examples'
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
TypCoverage >> link: aBlock runUnlink: aSymbol [
	| a b nodes |
	(self class >> aSymbol) compiledMethod recompile.
	a := self perform: aSymbol.
	(self class >> aSymbol) ast
		nodesDo: [ :n | 
			n removeProperty: #tagExecuted ifAbsent: [  ].
			(aBlock value: n)
				ifTrue: [ n
						propertyAt: #tagExecuted put: false;
						link: link ] ].
	b := [ self perform: aSymbol ]
		on: Error
		do: [ :e | e ].
	link uninstall.
	self assert: a equals: b.
	(self class >> aSymbol) ast
		nodesDo: [ :n | 
			(aBlock value: n)
				ifTrue: [ self assert: (n propertyAt: #tagExecuted) ] ].
	^ {a.
	b}
]

{ #category : #accessing }
TypCoverage >> metaLinkDynamicArrayArgument [
	^ OrderedCollection new , {self}
]

{ #category : #accessing }
TypCoverage >> metaLinkLongNestedLiteralArray [
	^ #(#[1 0 9 0 1 0 13 0 9 0 17 0 10 0 21 0 13 0 25 0 15 0 29 0 17 0 33 0 18 0 33 0 19 0 33 0 20 0 33 0 21 0 33 0 22 0 33 0 23 0 33 0 24 0 33 0 25 0 65 0 27] #[0 0 6 0 3 0 4 0 8 0 12 0 14 0 28] #[0 0 10 0 3 0 4 0 8 0 12 0 14 0 28] #[1 0 25 0 15 0 69 0 27] #[1 0 9 0 1 0 13 0 9 0 17 0 10 0 21 0 13 0 25 0 15 0 73 0 17 0 33 0 18 0 33 0 19 0 33 0 20 0 33 0 21 0 33 0 22 0 33 0 23 0 33 0 24 0 33 0 25 0 65 0 27] #[0 0 14 0 2 0 3 0 4 0 6 0 7 0 8 0 11 0 12 0 14 0 28] #[1 0 77 0 4 0 0 0 28] #[0 0 18 0 3 0 4 0 8 0 12 0 14 0 28] #[0 0 22 0 3 0 4 0 8 0 12 0 14 0 28] #[0 0 26 0 3 0 4 0 8 0 12 0 14 0 28] #[0 0 30 0 3 0 4 0 8 0 12 0 14 0 28] #[0 0 34 0 3 0 4 0 8 0 12 0 14 0 28] #[0 0 38 0 3 0 4 0 8 0 12 0 14 0 28] #[0 0 42 0 3 0 4 0 8 0 12 0 14 0 28] #[0 0 46 0 3 0 4 0 8 0 12 0 14 0 28] #[1 0 81 0 2 0 50 0 3 0 50 0 4 0 85 0 6 0 50 0 8 0 89 0 11 0 50 0 12 0 50 0 14 0 50 0 28] #[1 0 54 0 3 0 54 0 4 0 93 0 7 0 54 0 8 0 54 0 12 0 54 0 14 0 54 0 28] #[1 0 77 0 4 0 97 0 14] #[1 0 9 0 1 0 13 0 9 0 17 0 10 0 21 0 13 0 25 0 15 0 101 0 18 0 101 0 19 0 101 0 20 0 101 0 21 0 101 0 22 0 101 0 23 0 101 0 24 0 101 0 25 0 65 0 27] #[1 0 9 0 1 0 58 0 3 0 13 0 9 0 17 0 10 0 21 0 13 0 25 0 15 0 105 0 17 0 33 0 18 0 33 0 19 0 33 0 20 0 33 0 21 0 33 0 22 0 33 0 23 0 33 0 24 0 33 0 25 0 109 0 26 0 65 0 27] #[1 0 9 0 1 0 13 0 9 0 17 0 10 0 21 0 13 0 25 0 15 0 113 0 17 0 33 0 18 0 33 0 19 0 33 0 20 0 33 0 21 0 33 0 22 0 33 0 23 0 33 0 24 0 33 0 25 0 65 0 27] #[1 0 9 0 1 0 13 0 9 0 17 0 10 0 58 0 12 0 21 0 13 0 25 0 15 0 105 0 17 0 33 0 18 0 33 0 19 0 33 0 20 0 33 0 21 0 33 0 22 0 33 0 23 0 33 0 24 0 33 0 25 0 117 0 26 0 65 0 27] #[1 0 9 0 1 0 13 0 9 0 17 0 10 0 21 0 13 0 25 0 15 0 121 0 18 0 121 0 19 0 121 0 20 0 121 0 21 0 121 0 22 0 121 0 23 0 121 0 24 0 121 0 25 0 65 0 27] #[0 0 62 0 3 0 4 0 8 0 12 0 14 0 28] #[0 0 66 0 3 0 4 0 8 0 12 0 14 0 28] #[1 0 70 0 3 0 77 0 4 0 70 0 12] #[0 0 125 0 3] #[1 0 77 0 4 0 129 0 8] #[0 0 133 0 12] #[0 0 74 0 3 0 4 0 8 0 12 0 14 0 28] #[0 0 137 0 5] #[0 0 78 0 3 0 4 0 8 0 12 0 14 0 28] #[0 0 141 0 5] #[1 0 9 0 1 0 13 0 9 0 17 0 10 0 21 0 13 0 25 0 15 0 145 0 18 0 145 0 19 0 145 0 20 0 145 0 21 0 145 0 22 0 145 0 23 0 145 0 24 0 145 0 25 0 65 0 27] #[1 0 9 0 1 0 13 0 9 0 17 0 10 0 21 0 13 0 25 0 15 0 149 0 18 0 149 0 19 0 149 0 20 0 149 0 21 0 149 0 22 0 149 0 23 0 149 0 24 0 149 0 25 0 65 0 27] #[0 0 82 0 3 0 4 0 8 0 12 0 14 0 28] #[0 0 86 0 3 0 4 0 8 0 12 0 14 0 28])
]

{ #category : #accessing }
TypCoverage >> metaLinkPragma [
	<tudelu>
	^ 4
]

{ #category : #accessing }
TypCoverage >> metaLinkProblematicMessages [
	| n |
	n := 5.
	^ {} == 2 and: [ {} = 3 and: [ n > 6 ] ]
]

{ #category : #accessing }
TypCoverage >> run [
	<gtExample>
	| package result |
	package := 'Typer-Core' asPackage.
	package methods do: #recompile.
	package methods
		do: [ :m | 
			m ast
				nodesDo: [ :n | 
					n removeProperty: #tagExecuted ifAbsent: [  ].
					((n isMessage and: [ #(#= #== #>) includes: n selector ]) not
						and: [ n isPragma not
								and: [ n isDynamicArray not and: [ n isLiteralArray not ] ] ])
						ifTrue: [ n
								propertyAt: #tagExecuted put: false;
								link: link ] ] ].
	result := (GtExplicitExampleGroup
		withAll:
			('Typer-Core-Examples' asPackage gtExamplesContained
				reject: [ :e | e methodClass = self class instanceSide ])) runAll.
	link uninstall.
	^ result
]

{ #category : #accessing }
TypCoverage >> runMetaLinkDynamicArrayArgument [
	<gtExample>
	^ self
		link: [ :n | n isDynamicArray ]
		runUnlink: #metaLinkDynamicArrayArgument
]

{ #category : #accessing }
TypCoverage >> runMetaLinkLongNestedLiteralArray [
	<gtExample>
	^ self
		link: [ :n | n isLiteralArray ]
		runUnlink: #metaLinkLongNestedLiteralArray
]

{ #category : #accessing }
TypCoverage >> runMetaLinkPragma [
	<gtExample>
	^ self
		link: [ :n | n isPragma ]
		runUnlink: #metaLinkPragma
]

{ #category : #accessing }
TypCoverage >> runMetaLinkProblematicMessages [
	<gtExample>
	^ self
		link: [ :n | n isMessage ]
		runUnlink: #metaLinkProblematicMessages
]
