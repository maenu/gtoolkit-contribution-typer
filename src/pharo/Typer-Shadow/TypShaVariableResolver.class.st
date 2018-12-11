Class {
	#name : #TypShaVariableResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaVariableResolver >> resolversFor: aLookup [
	| name |
	name := '___' , aLookup selector.
	^ name first isUppercase
		ifTrue: [ {(shadow class instanceSide classVarNamed: name)} ]
		ifFalse: [ {(shadow instVarNamed: name)} ]
]

{ #category : #accessing }
TypShaVariableResolver >> resolves: aLookup [
	^ aLookup receiverType hasClass
		and: [ aLookup receiverType asClass == shadow shadowedClass
				and: [ | name |
					name := '___' , aLookup selector.
					name first isUppercase
						ifTrue: [ shadow class instanceSide hasClassVarNamed: name ]
						ifFalse: [ shadow class hasInstVarNamed: name ] ] ]
]
