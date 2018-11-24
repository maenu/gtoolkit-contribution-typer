Class {
	#name : #TypGtPatternStyler,
	#superclass : #Object,
	#instVars : [
		'source'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #'as yet unclassified' }
TypGtPatternStyler >> extraStyle: aText ast: ast [
	
]

{ #category : #'as yet unclassified' }
TypGtPatternStyler >> style: aText ast: ast [
	source := aText.
	self visitMethodNode: ast
]

{ #category : #visiting }
TypGtPatternStyler >> styleFrom: from to: to with: attributes [
	(source from: from to: to) attributes: attributes
]

{ #category : #visiting }
TypGtPatternStyler >> styleValueNode: aNode with: aTypes [
	self
		styleFrom: aNode stop
		to: aNode stop
		with:
			{(TypGtTypeAttribute new
				types: aTypes;
				yourself)}
]

{ #category : #visiting }
TypGtPatternStyler >> visitArgumentNode: aNode [
	self styleValueNode: aNode with: aNode typTypes
]

{ #category : #visiting }
TypGtPatternStyler >> visitMethodNode: aNode [
	aNode arguments do: [ :e | self visitArgumentNode: e ].
	self styleValueNode: aNode with: aNode typTypesForResult
]
