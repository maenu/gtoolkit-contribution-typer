Class {
	#name : #TypShaTypeResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaTypeResolver >> resolversFor: aLookup [
	^ {shadow typeResolver}
]

{ #category : #accessing }
TypShaTypeResolver >> resolves: aLookup [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeResultAs: 'Boolean'>
	^ aLookup clazz == shadow shadowedClass
]
