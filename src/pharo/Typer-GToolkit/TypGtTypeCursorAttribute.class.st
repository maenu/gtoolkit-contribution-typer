Class {
	#name : #TypGtTypeCursorAttribute,
	#superclass : #BrTextCursorAttribute,
	#instVars : [
		'coder',
		'attribute'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtTypeCursorAttribute >> attribute [
	<typPraResult: 'BrTextAdornmentAttribute'>
	^ attribute
]

{ #category : #accessing }
TypGtTypeCursorAttribute >> attribute: anObject [
	<typPraArguments: 'BrTextAdornmentAttribute'>
	attribute := anObject
]

{ #category : #accessing }
TypGtTypeCursorAttribute >> coder [
	<typPraResult: 'TypGtMethodCoder'>
	^ coder
]

{ #category : #accessing }
TypGtTypeCursorAttribute >> coder: anObject [
	<typPraArguments: 'TypGtMethodCoder'>
	coder := anObject
]

{ #category : #initialization }
TypGtTypeCursorAttribute >> initialize [
	<typPraVariable: 'attribute' as: 'BrTextAdornmentAttribute'>
	<typPraVariable: 'coder' as: 'TypGtMethodCoder'>
	super initialize.
	self
		enterAction: [ :aTextEditor :anEvent | 
			| node |
			node := coder rbAST
				bestNodeFor: (anEvent cursor position to: anEvent cursor position).
			(aTextEditor text from: node stop to: node stop)
				attribute: attribute.
			aTextEditor invalidate: node stop to: node stop.
			aTextEditor update: node stop to: node stop ];
		leaveAction: [ :aTextEditor :anEvent | 
			| node |
			node := coder rbAST
				bestNodeFor: (anEvent cursor position to: anEvent cursor position).
			(aTextEditor text from: node stop to: node stop)
				clearAttributes: [ :e | e == attribute ].
			aTextEditor invalidate: node stop to: node stop.
			aTextEditor update: node stop to: node stop ]
]
