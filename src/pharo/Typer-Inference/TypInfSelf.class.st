Class {
	#name : #TypInfSelf,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSelf >> canLookup: aType method: aSymbol arguments: aCollection [
	^ context self
		canResolveMethod: (TypMethodLookup
				receiver: context self
				selector: aSymbol
				arguments: aCollection
				self: (self selfIn: aType)
				super: (self superIn: aType)
				parent: nil)
]

{ #category : #accessing }
TypInfSelf >> lookup: aType method: aSymbol arguments: aCollection [
	^ context self
		resolveMethod: (TypMethodLookup
				receiver: context self
				selector: aSymbol
				arguments: aCollection
				self: (self selfIn: aType)
				super: (self superIn: aType)
				parent: nil)
]

{ #category : #accessing }
TypInfSelf >> selfIn: aType [
	^ context self
]

{ #category : #accessing }
TypInfSelf >> superIn: aType [
	^ context super
]

{ #category : #initialization }
TypInfSelf >> transfer [
	state at: self put: context self
]
