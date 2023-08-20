Class {
	#name : #TypInfSuper,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSuper >> canLookup: aType method: aSymbol arguments: aCollection [
	^ (self superIn: aType)
		ifNil: [ false ]
		ifNotNil: [ :t | 
			context self
				canResolveMethod: (TypMethodLookup
						receiver: t
						selector: aSymbol
						arguments: aCollection
						self: (self selfIn: aType)
						super: t
						parent: nil) ]
]

{ #category : #accessing }
TypInfSuper >> lookup: aType method: aSymbol arguments: aCollection [
	^ context self
		resolveMethod: (TypMethodLookup
				receiver: (self superIn: aType)
				selector: aSymbol
				arguments: aCollection
				self: (self selfIn: aType)
				super: (self superIn: aType)
				parent: nil)
]

{ #category : #accessing }
TypInfSuper >> selfIn: aType [
	^ context self
]

{ #category : #accessing }
TypInfSuper >> superIn: aType [
	^ context super ifNil: nil ifNotNil: #superOrNil
]

{ #category : #initialization }
TypInfSuper >> transfer [
	state at: self put: (context super ifNil: TypNilType instance)
]
