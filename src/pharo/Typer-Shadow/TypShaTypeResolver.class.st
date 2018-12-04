Class {
	#name : #TypShaTypeResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow'
}

{ #category : #accessing }
TypShaTypeResolver >> resolverFor: aLookup [
	^ self
]

{ #category : #accessing }
TypShaTypeResolver >> resolves: aLookup [
	^ aLookup clazz == shadow shadowedClass and: [ shadow respondsTo: #typShaAsType: ]
]

{ #category : #accessing }
TypShaTypeResolver >> typeFor: aLookup resolvedBy: anotherLookup [
	^ shadow typShaAsType: aLookup clazz typAsType
]
