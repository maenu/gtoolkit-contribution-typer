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
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				withParameters: {GtCompletionAction typAsType})
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
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #shadow }
TypShaGtGtPharoCompletionStrategy >> mNodeForIn: aLookup [
	<typShaMethod: 'nodeFor:in:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPharoProgramNode typAsType asNullable
		arguments:
			{Integer typAsType.
			GtPharoMethodNode typAsType}
]

{ #category : #shadow }
TypShaGtGtPharoCompletionStrategy >> mSelectorsForReceiverMatching: aLookup [
	<typShaMethod: 'selectorsForReceiver:matching:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				withParameters: {String typAsType})
		arguments:
			{Behavior typAsType.
			String typAsType}
]

{ #category : #'as yet unclassified' }
TypShaGtGtPharoCompletionStrategy >> vMaxItems: aLookup [
	<typShaVariable: #maxItems>
	^ Integer typAsType
]
