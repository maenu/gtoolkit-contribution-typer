Extension { #name : #TypManifest }

{ #category : #'*Typer-GToolkit' }
TypManifest class >> typGtBuildAllFor: anAction [
	<gtClassAction>
	<gtAction>
	^ anAction explicit
		priority: -1;
		stencil: [ TypGtPromiseButton new
				label: 'Build';
				action: [ self buildAll ];
				yourself ]
]

{ #category : #'*Typer-GToolkit' }
TypManifest class >> typGtInvalidateAllFor: anAction [
	<gtClassAction>
	<gtAction>
	^ anAction explicit
		priority: 0;
		stencil: [ TypGtPromiseButton new
				label: 'Invalidate';
				action: [ self invalidateAll ];
				yourself ]
]

{ #category : #'*Typer-GToolkit' }
TypManifest class >> typGtLoggerFor: aView [
	<gtClassView>
	<gtView>
	^ aView explicit
		title: 'Logger';
		priority: 2;
		stencil: [ GtInspectorTool forObject: logger ]
]

{ #category : #'*Typer-GToolkit' }
TypManifest class >> typGtManifestsFor: aView [
	<gtClassView>
	<gtView>
	^ aView list
		title: 'Manifests';
		priority: 4;
		items: [ self manifests ];
		itemText: #shortName;
		sendTool: [ :e | GtClassCoderTool forClass: e ]
]

{ #category : #'*Typer-GToolkit' }
TypManifest class >> typGtMethodLookupIndexFor: aView [
	<gtClassView>
	<gtView>
	^ aView forward
		title: 'met lookup';
		priority: 3.1;
		object: [ TypMethodLookup ];
		view: #typGtIndexFor:
]

{ #category : #'*Typer-GToolkit' }
TypManifest class >> typGtNukeFor: anAction [
	<gtClassAction>
	<gtAction>
	^ anAction explicit
		priority: 1;
		stencil: [ TypGtPromiseButton new
				label: 'Nuke';
				action: [ self nuke ];
				yourself ]
]

{ #category : #'*Typer-GToolkit' }
TypManifest class >> typGtPackagesFor: aView [
	<gtClassView>
	<gtView>
	^ aView list
		title: 'Packages';
		priority: 5;
		items: [ self packages ];
		sendTool: [ :e | GtPackageCoderTool package: e ]
]

{ #category : #'*Typer-GToolkit' }
TypManifest class >> typGtStatusAllFor: aView [
	<gtClassView>
	<gtView>
	^ aView columnedTree
		title: 'Status All';
		priority: 0;
		items: [ self manifests collect: #typGtStatusRoot ];
		column: 'State'
			icon: [ :c | self typGtStatusIconFor: c first ]
			width: 64;
		column: 'Manifest'
			text: #second
			width: 64;
		column: 'Property'
			text: #third
			width: 128;
		column: 'Description'
			text: #fourth
			width: 256;
		sendTool: [ :c | 
			| object |
			object := c fifth.
			object isClass
				ifTrue: [ GtClassCoderTool forClass: object ]
				ifFalse: [ GtInspectorTool forObject: object ] ];
		children: #sixth;
		expandAll;
		actionUpdateButton
]

{ #category : #'*Typer-GToolkit' }
TypManifest class >> typGtStatusChildren [
	^ {logger
			ifNil: [ {3.
					''.
					#logger.
					'nil, build?'.
					logger.
					#()} ]
			ifNotNil: [ logger isRunning
					ifTrue: [ {1.
							''.
							#logger.
							'running'.
							logger.
							#()} ]
					ifFalse: [ {2.
							''.
							#logger.
							'not running, start?'.
							logger.
							#()} ] ].
		threadPool
			ifNil: [ {3.
					''.
					#threadPool.
					'nil, build?'.
					threadPool.
					#()} ]
			ifNotNil: [ {1.
					''.
					#threadPool.
					'running'.
					threadPool.
					#()} ].
		subscription
			ifNil: [ {3.
					''.
					#subscription.
					'nil, build?'.
					subscription.
					#()} ]
			ifNotNil: [ {1.
					''.
					#subscription.
					'running'.
					subscription.
					#()} ]}
]

{ #category : #'*Typer-GToolkit' }
TypManifest class >> typGtThreadPoolFor: aView [
	<gtClassView>
	<gtView>
	^ aView explicit
		title: 'Thread Pool';
		priority: 3;
		stencil: [ GtInspectorTool forObject: threadPool ]
]

{ #category : #'*Typer-GToolkit' }
TypManifest class >> typGtTypeLookupIndexFor: aView [
	<gtClassView>
	<gtView>
	^ aView forward
		title: 'typ lookup';
		priority: 3.1;
		object: [ TypTypeLookup ];
		view: #typGtIndexFor:
]

{ #category : #'*Typer-GToolkit' }
TypManifest class >> typGtVariableLookupIndexFor: aView [
	<gtClassView>
	<gtView>
	^ aView forward
		title: 'var lookup';
		priority: 3.1;
		object: [ TypVariableLookup ];
		view: #typGtIndexFor:
]
