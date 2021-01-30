Class {
	#name : #TypMethodLookupResult,
	#superclass : #TypLookupResult,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypMethodLookupResult >> argumentTypes [
	self subclassResponsibility
]

{ #category : #accessing }
TypMethodLookupResult >> resultType [
	self subclassResponsibility
]

{ #category : #accessing }
TypMethodLookupResult >> signalsAlways [
	self subclassResponsibility
]

{ #category : #accessing }
TypMethodLookupResult >> type [
	self subclassResponsibility
]
