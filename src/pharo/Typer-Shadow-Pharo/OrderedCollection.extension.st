Extension { #name : #OrderedCollection }

{ #category : #'*Typer-Shadow-Pharo' }
OrderedCollection >> typShaMethodAddFirst: aLookup [
	<typShaMethod: 'addFirst:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1)
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedCollection >> typShaMethodAtPut: aLookup [
	<typShaMethod: 'at:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {Integer typAsType.
				aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedCollection >> typShaMethodRemoveLast: aLookup [
	<typShaMethod: 'removeLast'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #A)
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedCollection >> typShaResolve: aLookup [ 
	<typShaType>
	
	^ aLookup root classDescription
		typAsParametricTypeWithParameters: {(#A -> #A typAsVariableType)} asOrderedDictionary
]
