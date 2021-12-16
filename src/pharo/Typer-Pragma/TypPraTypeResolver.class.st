Class {
	#name : #TypPraTypeResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraTypeResolver >> canResolve: aLookup [
	^ aLookup classDescription typPraHasType
]

{ #category : #accessing }
TypPraTypeResolver >> resolve: aLookup [

	self assert: [ self canResolve: aLookup ].
	^ aLookup classDescription typPraType
]
