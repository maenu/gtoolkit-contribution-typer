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

	| resolved |
	self assert: [ self canResolve: aLookup ].
	resolved := aLookup classDescription typPraType.
	self
		addDependent: aLookup label: #resolve:;
		addDependent: resolved
		label: #pragma
		data: aLookup classDescription class >> #initialize.
	^ aLookup addDependent: resolved label: #resolved data: self
]
