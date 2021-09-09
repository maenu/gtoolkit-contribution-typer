Class {
	#name : #TypShaResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaResolver >> resolve: aLookup reduce: aCollection [

	| resolved |
	aCollection ifEmpty: [ 
		^ aLookup
			  addDependent: TypUnknownType new
			  label: #default
			  data: self ].
	aCollection sort.
	resolved := aCollection first.
	aCollection copyWithoutFirst do: [ :e | 
		self addDependent: e label: #alternative data: resolved ].
	^ aLookup addDependent: resolved label: #resolved data: self
]
