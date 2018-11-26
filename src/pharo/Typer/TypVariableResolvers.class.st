Class {
	#name : #TypVariableResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypVariableResolvers >> typTypeForVariableNamed: aSymbol ofClass: aClass [
	^ self typTypeForVariableNamed: aSymbol ofClass: aClass withDiscovered: Set new
]

{ #category : #'as yet unclassified' }
TypVariableResolvers >> typTypeForVariableNamed: aSymbol ofClass: aClass withDiscovered: aSet [
	^ self typTypeFor: aClass typAsType -> aSymbol using: [ :r :a | r typTypeWithDiscovered: aSet ] withDiscovered: aSet
]
