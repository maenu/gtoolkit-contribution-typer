Class {
	#name : #TypShaGtGtPharoCompletionStrategy,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPharoCompletionStrategy class >> shadowedClass [
	^ GtPharoCompletionStrategy class
]

{ #category : #shadow }
TypShaGtGtPharoCompletionStrategy >> mActionsForAt: aLookup [
	<typShaMethod: 'actionsFor:at:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {GtCompletionAction typAsType})
		arguments:
			{GtPharoMethodNode typAsType.
			Integer typAsType}
]

{ #category : #shadow }
TypShaGtGtPharoCompletionStrategy >> mClassOrMetaClass: aLookup [
	<typShaMethod: 'classOrMetaClass:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {ClassDescription typAsType}
]

{ #category : #shadow }
TypShaGtGtPharoCompletionStrategy >> mIndex: aLookup [
	<typShaMethod: 'index'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #shadow }
TypShaGtGtPharoCompletionStrategy >> mNodeForIn: aLookup [
	<typShaMethod: 'nodeFor:in:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPharoProgramNode typAsType asNullable
		arguments:
			{Integer typAsType.
			GtPharoMethodNode typAsType}
]

{ #category : #shadow }
TypShaGtGtPharoCompletionStrategy >> mSelectorsForReceiverMatching: aLookup [
	<typShaMethod: 'selectorsForReceiver:matching:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {String typAsType})
		arguments:
			{Behavior typAsType.
			String typAsType}
]

{ #category : #'as yet unclassified' }
TypShaGtGtPharoCompletionStrategy >> vMaxItems: aLookup [
	<typShaForVariable: #maxItems>
	^ Integer typAsType
]
