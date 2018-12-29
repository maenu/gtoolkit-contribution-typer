Class {
	#name : #TypGtTypeCursorAttribute,
	#superclass : #BrTextCursorAttribute,
	#instVars : [
		'coder',
		'attribute'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtTypeCursorAttribute >> attribute [
	<typTypeResultAs: 'BrTextAdornmentAttribute'>
	^ attribute
]

{ #category : #accessing }
TypGtTypeCursorAttribute >> attribute: anObject [
	<typTypeArgument: 1 as: 'BrTextAdornmentAttribute'>
	attribute := anObject
]

{ #category : #accessing }
TypGtTypeCursorAttribute >> coder [
	^ coder
]

{ #category : #accessing }
TypGtTypeCursorAttribute >> coder: anObject [
	coder := anObject
]

{ #category : #initialization }
TypGtTypeCursorAttribute >> initialize [
	<typTypeVariable: 'attribute' as: 'BrTextAdornmentAttribute'>
	super initialize.
	self
		enterAction: [ :aTextEditor :anEvent | 
			| node |
			node := coder rbAST bestNodeFor: (anEvent cursor position  to: anEvent cursor position).
			(aTextEditor text from: node stop to: node stop) attribute: attribute.
			aTextEditor invalidate: node stop to: node stop.
			aTextEditor update: node stop to: node stop ];
		leaveAction: [ :aTextEditor :anEvent | 
			| node |
			node := coder rbAST bestNodeFor: (anEvent cursor position  to: anEvent cursor position).
			(aTextEditor text from: node stop to: node stop)
				clearAttributes: [ :e | e == attribute ].
			aTextEditor invalidate: node stop to: node stop.
			aTextEditor update: node stop to: node stop ]
]
