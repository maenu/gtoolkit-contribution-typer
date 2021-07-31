Class {
	#name : #TypGtCursorAttribute,
	#superclass : #BrTextCursorAttribute,
	#instVars : [
		'coder',
		'attribute',
		'node'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtCursorAttribute >> attribute [
	<typPraResult: 'BrTextAdornmentAttribute'>
	^ attribute
]

{ #category : #accessing }
TypGtCursorAttribute >> attribute: anObject [
	<typPraArguments: 'BrTextAdornmentAttribute'>
	attribute := anObject
]

{ #category : #accessing }
TypGtCursorAttribute >> coder [
	<typPraResult: 'TypGtMethodCoder'>
	^ coder
]

{ #category : #accessing }
TypGtCursorAttribute >> coder: anObject [
	<typPraArguments: 'TypGtMethodCoder'>
	coder := anObject
]

{ #category : #initialization }
TypGtCursorAttribute >> initialize [

	<typPraVariable: 'attribute' as: 'BrTextAdornmentAttribute'>
	<typPraVariable: 'coder' as: 'TypGtMethodCoder'>
	super initialize.
	self
		enterAction: [ :aTextEditor :anEvent | 
			node stop <= aTextEditor text size ifTrue: [ 
					(aTextEditor text from: node stop to: node stop) attribute:
							attribute ] ];
		leaveAction: [ :aTextEditor :anEvent | 
			aTextEditor text removeAttribute: attribute ]
]

{ #category : #accessing }
TypGtCursorAttribute >> node [
	<typPraResult: 'RBProgramNode'>
	^ node
]

{ #category : #accessing }
TypGtCursorAttribute >> node: anObject [
	<typPraArguments: 'RBProgramNode'>
	node := anObject
]
