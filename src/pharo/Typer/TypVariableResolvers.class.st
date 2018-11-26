Class {
	#name : #TypVariableResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypVariableResolvers >> typTypeForVariableNamed: aString ofClass: aClass [
	^ self typTypeForVariableNamed: aString ofClass: aClass withDiscovered: Set new
]

{ #category : #'as yet unclassified' }
TypVariableResolvers >> typTypeForVariableNamed: aString ofClass: aClass withDiscovered: aSet [
	^ self typTypeFor: aClass -> aString using: [ :r :a :s | r typTypeWithDiscovered: s ] withDiscovered: aSet
]
