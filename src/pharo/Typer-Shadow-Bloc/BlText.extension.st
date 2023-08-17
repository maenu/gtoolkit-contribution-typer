Extension { #name : #BlText }

{ #category : #'*Typer-Shadow-Bloc' }
BlText >> typShaMethodAttribute: aLookup [
	<typShaMethod: 'attribute:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlTextAttribute typAsType}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlText >> typShaMethodAttributesAt: aLookup [
	<typShaMethod: 'attributesAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {BlTextAttribute typAsType})
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlText >> typShaMethodClearAttributes: aLookup [
	<typShaMethod: 'clearAttributes:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {BlTextAttribute typAsType}}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlText >> typShaMethodFromTo: aLookup [
	<typShaMethod: 'from:to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BlText typAsType
		arguments: {Integer typAsType.
				Integer typAsType}
]
