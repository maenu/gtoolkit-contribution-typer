Class {
	#name : #TypNilOrigin,
	#superclass : #TypOrigin,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypNilOrigin class >> instance [
	^ instance ifNil: [ instance := self basicNew initialize ]
]

{ #category : #accessing }
TypNilOrigin class >> new [
	self shouldNotImplement
]

{ #category : #accessing }
TypNilOrigin >> isNil [
	^ true
]
