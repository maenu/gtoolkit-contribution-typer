Extension { #name : #GtPhlowProtoView }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowProtoView >> typShaMethodExplicit: aLookup [
	<typShaMethod: 'explicit'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtPhlowExplicitView typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowProtoView >> typShaMethodMondrian: aLookup [
	<typShaMethod: 'mondrian'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtPhlowMondrianView typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowProtoView >> typShaMethodPriority: aLookup [
	<typShaMethod: 'priority:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowProtoView >> typShaMethodTitle: aLookup [
	<typShaMethod: 'title:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {String typAsType}
]
